#!/bin/bash

set -e

# ========== CONFIG ==========
JENKINS_URL=http://localhost:8080
JENKINS_HOME_DIR="./jenkins_data"
JENKINS_WAR="./jenkins.war"
JENKINS_CLI="./jenkins-cli.jar"
JENKINS_VERSION_CACHE=".jenkins_version"
CLI_VERSION_CACHE=".cli_version"
ADMIN_USER="duyjenkinsui"
ADMIN_TOKEN="11a109b706c91ba2bf7ebb7f5d687881cf"  # <-- thay token ở đây
CONFIG_XML="config_jenkins.xml"
JOB_NAME="github-pipeline_cli"
# ============================

mkdir -p "$JENKINS_HOME_DIR"
export JENKINS_HOME="$JENKINS_HOME_DIR"

# ====== CHECK AND DOWNLOAD LATEST JENKINS WAR ======
echo "🔍 Checking latest Jenkins LTS version..."
LATEST_JENKINS_VERSION=$(curl -s https://updates.jenkins.io/stable/latestCore.txt)

if [ -f "$JENKINS_VERSION_CACHE" ]; then
  CURRENT_JENKINS_VERSION=$(cat "$JENKINS_VERSION_CACHE")
else
  CURRENT_JENKINS_VERSION="none"
fi

if [ "$LATEST_JENKINS_VERSION" != "$CURRENT_JENKINS_VERSION" ]; then
  echo "⬇️ Downloading Jenkins WAR v$LATEST_JENKINS_VERSION..."
  curl -s -L -o "$JENKINS_WAR" https://get.jenkins.io/war-stable/latest/jenkins.war
  echo "$LATEST_JENKINS_VERSION" > "$JENKINS_VERSION_CACHE"
else
  echo "✅ Jenkins WAR is up-to-date (v$CURRENT_JENKINS_VERSION)."
fi

# ====== START JENKINS IN BACKGROUND ======
echo "🚀 Starting Jenkins..."
nohup java -jar "$JENKINS_WAR" > jenkins.log 2>&1 &

# ====== WAIT FOR JENKINS TO BE READY ======
echo "⏳ Waiting for Jenkins to be ready..."
until curl -s "$JENKINS_URL/login" | grep -q "Jenkins"; do
  echo -n "."
  sleep 5
done
echo "✅ Jenkins is ready!"

# ====== CHECK AND DOWNLOAD JENKINS CLI ======
echo "🔍 Checking jenkins-cli.jar version..."
CLI_URL="$JENKINS_URL/jnlpJars/jenkins-cli.jar"
CLI_ETAG_FILE=".cli_etag"

# Download CLI with caching via ETag
ETAG=""
if [ -f "$CLI_ETAG_FILE" ]; then
  ETAG=$(cat "$CLI_ETAG_FILE")
fi

RESPONSE=$(curl -s -L -w "%{http_code}" -o "$JENKINS_CLI" -H "If-None-Match: \"$ETAG\"" -D - "$CLI_URL")

# Save new ETag if updated
if grep -qi "etag" <<< "$RESPONSE"; then
  echo "$RESPONSE" | grep -i "etag" | cut -d' ' -f2 | tr -d '\r' > "$CLI_ETAG_FILE"
  echo "⬇️ Jenkins CLI updated."
elif [[ "$RESPONSE" == *"304" ]]; then
  echo "✅ Jenkins CLI is up-to-date."
fi

# ====== CREATE OR UPDATE JOB ======
echo "⚙️  Creating or updating job '$JOB_NAME'..."
if java -jar "$JENKINS_CLI" -s $JENKINS_URL -auth $ADMIN_USER:$ADMIN_TOKEN get-job "$JOB_NAME" >/dev/null 2>&1; then
  echo "🔄 Job exists. Updating..."
  java -jar "$JENKINS_CLI" -s $JENKINS_URL -auth $ADMIN_USER:$ADMIN_TOKEN update-job "$JOB_NAME" < "$CONFIG_XML"
else
  echo "➕ Job does not exist. Creating..."
  java -jar "$JENKINS_CLI" -s $JENKINS_URL -auth $ADMIN_USER:$ADMIN_TOKEN create-job "$JOB_NAME" < "$CONFIG_XML"
fi

# ====== TRIGGER JOB BUILD ======
BUILD_NUMBER=$(java -jar "$JENKINS_CLI" -s $JENKINS_URL -auth $ADMIN_USER:$ADMIN_TOKEN get-job "$JOB_NAME" | grep '<nextBuildNumber>' | sed -E 's/.*<nextBuildNumber>([0-9]+)<\/nextBuildNumber>.*/\1/')
echo "🚧 Triggering build #$BUILD_NUMBER for '$JOB_NAME'..."
java -jar "$JENKINS_CLI" -s $JENKINS_URL -auth $ADMIN_USER:$ADMIN_TOKEN build "$JOB_NAME" -s -v

# ====== CHECK BUILD RESULT ======
echo "📦 Waiting for build result..."
RESULT=$(java -jar "$JENKINS_CLI" -s $JENKINS_URL -auth $ADMIN_USER:$ADMIN_TOKEN console "$JOB_NAME" "$BUILD_NUMBER" | grep -E "Finished: (SUCCESS|FAILURE|ABORTED)" | tail -1)

echo "✅ Build result: $RESULT"
