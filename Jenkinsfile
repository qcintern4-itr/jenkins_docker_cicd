pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *')  // Check SCM every 5 minutes
    }

    environment {
        jobName = "${JOB_BASE_NAME}-${BUILD_NUMBER}"
        buildImage = "image:${JOB_BASE_NAME}-${BUILD_NUMBER}"
    }

    stages {
        stage('Building Container') {
            steps {
                script {
                    if (isUnix()) {
                        sh """
                            docker build -t $buildImage -f Dockerfile.test .
                            docker run -dit --name $jobName $buildImage
                        """
                    } else {
                        bat """
                            docker build -t %buildImage% -f Dockerfile.test .
                            docker run -dit --name %jobName% %buildImage%
                        """
                    }
                }
            }
        }

        stage('Run') {
            steps {
                script {
                    if (isUnix()) {
                        sh """
                            docker exec $jobName bash -c 'export USERNAME=auto-bot && python3 demo_jenkins.py'
                        """
                    } else {
                        bat """
                            docker exec %jobName% bash -c "export USERNAME=auto-bot && python demo_jenkins.py"
                        """
                    }
                }
            }
        }

//         stage('Publishing Report') {
//             steps {
//                 script {
//                     if (isUnix()) {
//                         sh """
//                             docker cp $jobName:/jenkins_docker_cicd/results \$WORKSPACE
//                             rm -rf public_results
//                             mkdir public_results
//                             log=\$(ls -ltr results/ | tail -n 1 | awk '{print \$9}')
//                             cp --recursive results/\$log/* public_results
//                         """
//                     } else {
//                         bat """
//                             docker cp %jobName%:/jenkins_docker_cicd/results %WORKSPACE%
//                             rmdir /s /q public_results
//                             mkdir public_results
//                             for /f %%i in ('dir /b /od results') do set log=%%i
//                             xcopy /E /Y results\\%log%\\* public_results\\
//                         """
//                     }
//
//                     step([
//                         $class: 'RobotPublisher',
//                         outputPath: 'public_results',
//                         outputFileName: 'output.xml',
//                         reportFileName: 'report.html',
//                         logFileName: 'log.html',
//                         disableArchiveOutput: false,
//                         passThreshold: 95.0,
//                         unstableThreshold: 95.0,
//                         otherFiles: "**/*.png, **/*.jpg"
//                     ])
//                 }
//             }
//         }
    }

    post {
        always {
            script {
                if (isUnix()) {
                    sh """
                        docker kill $jobName || true
                        docker rm $jobName || true
                        docker rmi $buildImage || true
                    """
                } else {
                    bat """
                        docker kill %jobName% || exit 0
                        docker rm %jobName% || exit 0
                        docker rmi %buildImage% || exit 0
                    """
                }
            }
        }
    }
}
