pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *')
    }

    environment {
        jobName = "${JOB_BASE_NAME}-${BUILD_NUMBER}"
        buildImage = "image:${jobName}"
    }

    stages {
        stage('Building Container') {
            steps {
                sh '''
                    docker build -t ${buildImage} -f Dockerfile.test .
                    docker run -dit --name ${jobName} ${buildImage}
                '''
            }
        }

        stage('Run') {
            steps {
                sh '''
                    docker exec ${jobName} bash -c "export USERNAME=auto-bot; python3 run.py -s project_bioflux_callcenter_portal/test/TEST-CICD.robot --env staging --browser chrome --headless"
                '''
            }
        }

        stage('Publishing Report') {
            steps {
                sh '''
                    docker cp ${jobName}:/jenkins_docker_cicd/results $WORKSPACE
                    rm -rf public_results
                    mkdir public_results
                    log=$(ls -ltr results/ | tail -n 1 | awk '{print $9}')
                    cp --recursive results/$log/* public_results
                '''
                step([
                    $class: 'RobotPublisher',
                    outputPath: 'public_results',
                    outputFileName: 'output.xml',
                    reportFileName: 'report.html',
                    logFileName: 'log.html',
                    disableArchiveOutput: false,
                    passThreshold: 95.0,
                    unstableThreshold: 95.0,
                    otherFiles: "**/*.png, **/*.jpg"
                ])
            }
        }
    }

    post {
        always {
            sh '''
                docker kill ${jobName} || true
                docker rm ${jobName} || true
                docker rmi ${buildImage} || true
            '''
        }
    }
}
