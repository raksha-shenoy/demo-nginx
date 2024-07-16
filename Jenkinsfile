// pipeline {
//     agent any

//     environment {
//         // Define environment variables if needed
//         DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\demo-nginx\\Dockerfile' // Update this with your Dockerfile path
//         DOCKER_IMAGE_TAG = 'raksha:latest' // Update with your desired image name and tag
//     }

//     stages {
//         // stage('Checkout') {
//         //     steps {
//         //         // Checkout the code from Git
//         //         git 'https://github.com/raksha-shenoy/new-demo-jenkins.git'
//         //     }
//         // }
//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     // Build Docker image using Docker Pipeline plugin
//                     docker.build("${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_PATH} .")
//                     bat "docker images"
//                 }
//             }
//         }
//         stage('trivy'){
//             steps{
//                 script{
//                     bat 'docker run -v var\\run\\docker.sock:\\var\\run\\docker.sock -v $HOME}\\Library\\Caches:\\root\\.cache\\ aquasec\\trivy:0.53.0 image python:3.4-alpine'
//                }
//             }
//         }
        
//     }
// }
pipeline {
    agent any
    
    environment {
        // Define Docker registry URL
        DOCKER_REGISTRY = 'docker.io'
        // Define Docker image details
        IMAGE_NAME = 'rakshashenoy/keer'
        IMAGE_TAG = 'latest'
        // Define Dockerfile path (if different from Jenkins workspace)
        DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\demo-nginx\\Dockerfile'  // This is optional if Dockerfile is in the root of your workspace
        // Define Docker credentials ID configured in Jenkins
        DOCKER_CREDENTIALS = 'DOCKER_CREDENTIALS'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKERFILE_PATH}"
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    // Tag Docker image
                    bat "docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Authenticate with Docker registry
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD} ${DOCKER_REGISTRY}"
                        // Push Docker image
                        bat "docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }
    }
}
