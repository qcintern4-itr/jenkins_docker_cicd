#!/bin/bash
set -e

# ========== CONFIG ==========
JENKINS_URL=http://localhost:8080
JENKINS_WAR="./jenkins.war"
JENKINS_CLI="jenkins-cli.jar"
ADMIN_USER="duyjenkinsui"
ADMIN_TOKEN="11a109b706c91ba2bf7ebb7f5d687881cf"
JOB_NAME="github-pipeline_cli"
JOB_CONFIG="config_jenkins.xml"
# ============================

# Start Jenkins in background
echo "🚀 Starting Jenkins WAR..."
nohup java -jar "$JENKINS_WAR" > jenkins.log 2>&1 &
JENKINS_PID=$!

# Wait for Jenkins to start
echo "⏳ Waiting for Jenkins to be ready (30s)..."
sleep 30

# Download Jenkins CLI if not exists
if [ ! -f "$JENKINS_CLI" ]; then
  echo "⬇️ Downloading Jenkins CLI..."
  curl -s -O "$JENKINS_URL/jnlpJars/jenkins-cli.jar"
else
  echo "✅ Jenkins CLI already exists. Skipping download."
fi

# Create or update job
echo "⚙️ Creating or updating Jenkins job '$JOB_NAME'..."

if java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
  -auth "$ADMIN_USER:$ADMIN_TOKEN" get-job "$JOB_NAME" >/dev/null 2>&1; then
  echo "♻️ Job exists. Updating..."
  java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
    -auth "$ADMIN_USER:$ADMIN_TOKEN" \
    update-job "$JOB_NAME" < "$JOB_CONFIG"
else
  echo "➕ Job does not exist. Creating..."
  java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
    -auth "$ADMIN_USER:$ADMIN_TOKEN" \
    create-job "$JOB_NAME" < "$JOB_CONFIG"
fi

#echo "⚙️ Triggering build for job '$JOB_NAME'..."
#
## Trigger build and wait for it to finish
#java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
#  -auth "$ADMIN_USER:$ADMIN_TOKEN" \
#  build "$JOB_NAME" -s -v
#
## Get last build number from job XML
#LAST_BUILD=$(java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
#  -auth "$ADMIN_USER:$ADMIN_TOKEN" \
#  get-job "$JOB_NAME" | grep -oPm1 "(?<=<lastBuild><number>)[^<]+")
#
#echo "⏳ Waiting for build #$LAST_BUILD console output..."
#
## Get result from console output
#RESULT=$(java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
#  -auth "$ADMIN_USER:$ADMIN_TOKEN" \
#  console "$JOB_NAME" "$LAST_BUILD" | grep -E "Finished: (SUCCESS|FAILURE|ABORTED)" | tail -1)
#
#echo "✅ Build result: $RESULT"


# Get next build number before build
java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
  -auth "$ADMIN_USER:$ADMIN_TOKEN" \
  build "$JOB_NAME" -s -v


