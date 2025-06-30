#!/bin/bash

set -e

JENKINS_URL=http://localhost:8080

echo "⏳ Waiting for Jenkins to be ready..."
sleep 40

# Get initial password
PASS=$(docker exec jenkins-server cat //var/jenkins_home/secrets/initialAdminPassword)

echo "🔐 Initial Admin Password:"
echo "$PASS"


# Download Jenkins CLI if not exists
if [ ! -f jenkins-cli.jar ]; then
  echo "Downloading Jenkins CLI..."
  curl -s -O $JENKINS_URL/jnlpJars/jenkins-cli.jar
else
  echo "Jenkins CLI already downloaded. Skipping download."
fi
# Create job
echo "Creating or updating Jenkins job..."

if java -jar jenkins-cli.jar -s $JENKINS_URL -http -auth admin:$PASS get-job github-pipeline_cli >/dev/null 2>&1; then
  echo "Job exists. Updating..."
  java -jar jenkins-cli.jar -s $JENKINS_URL -http \
    -auth admin:$PASS \
    update-job github-pipeline_cli < config_jenkins.xml
else
  echo "Job does not exist. Creating..."
  java -jar jenkins-cli.jar -s $JENKINS_URL -http \
    -auth admin:$PASS \
    create-job github-pipeline_cli < config_jenkins.xml
fi


# Get next build number before build
BUILD_NUMBER=$(java -jar jenkins-cli.jar -s $JENKINS_URL -http \
  -auth admin:$PASS \
  get-job github-pipeline_cli | grep '<nextBuildNumber>' | sed -E 's/.*<nextBuildNumber>([0-9]+)<\/nextBuildNumber>.*/\1/')

echo "Building Jenkins job #$BUILD_NUMBER ..."
java -jar jenkins-cli.jar -s $JENKINS_URL -http \
  -auth admin:$PASS \
  build github-pipeline_cli -s -v

# Waiting result
echo "Waiting for build #$BUILD_NUMBER result..."
RESULT=$(java -jar jenkins-cli.jar -s $JENKINS_URL -http \
  -auth admin:$PASS \
  console github-pipeline_cli $BUILD_NUMBER | grep -E "Finished: (SUCCESS|FAILURE|ABORTED)" | tail -1)

echo "Build result: $RESULT"