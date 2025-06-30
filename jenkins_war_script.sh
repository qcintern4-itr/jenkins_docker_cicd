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
echo "⏳ Waiting for Jenkins to be ready (60s)..."
sleep 60

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

# Get next build number
BUILD_NUMBER=$(java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
  -auth "$ADMIN_USER:$ADMIN_TOKEN" \
  get-job "$JOB_NAME" | grep '<nextBuildNumber>' | sed -E 's/.*<nextBuildNumber>([0-9]+)<\/nextBuildNumber>.*/\1/')

echo "🚧 Triggering build #$BUILD_NUMBER for job '$JOB_NAME'..."
java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
  -auth "$ADMIN_USER:$ADMIN_TOKEN" \
  build "$JOB_NAME" -s -v

# Get build result
echo "⏳ Waiting for build result..."
RESULT=$(java -jar "$JENKINS_CLI" -s "$JENKINS_URL" -http \
  -auth "$ADMIN_USER:$ADMIN_TOKEN" \
  console "$JOB_NAME" "$BUILD_NUMBER" | grep -E "Finished: (SUCCESS|FAILURE|ABORTED)" | tail -1)

echo "✅ Build result: $RESULT"

# (Optional) Stop Jenkins
# kill $JENKINS_PID
