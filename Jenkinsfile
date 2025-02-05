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
// pipeline {
//     agent any
    
//     environment {
//         // Define Docker registry URL
//         DOCKER_REGISTRY = 'docker.io'
//         // Define Docker image details
//         IMAGE_NAME = 'raksha'
//         IMAGE_TAG = 'latest'
//         // Define Dockerfile path (if different from Jenkins workspace)
//         DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\demo-nginx\\Dockerfile'  // This is optional if Dockerfile is in the root of your workspace
//         // Define Docker credentials ID configured in Jenkins
//         DOCKER_CREDENTIALS = 'DOCKER_CREDENTIALS'
//     }

//     stages {
//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     // Build Docker image
//                     bat "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKERFILE_PATH} ."
//                 }
//             }
//         }

//         stage('Tag Docker Image') {
//             steps {
//                 script {
//                     // Tag Docker image
//                     bat "docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
//                 }
//             }
//         }

//         stage('Push Docker Image') {
//             steps {
//                 script {
//                     // Authenticate with Docker registry
//                     withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
//                         bat "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD} ${DOCKER_REGISTRY}"
//                         // Push Docker image
//                         bat "docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
//                     }
//                 }
//             }
//         }
//     }
// }
pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "docker.io"
        IMAGE_NAME = "rakshashenoy/newdemo"
        IMAGE_TAG = "latest"

        SCANNER_HOME = tool 'sonar'
        
        DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\new-demo-jenkins\\Dockerfile' // Update this with your Dockerfile path
        // DOCKER_IMAGE_TAG = 'keer:latest' // Update with your desired image name and tag
        DOCKER_IMAGE_NAME = 'ng'
        // DOCKER_IMAGE_TAG = 'latest'
        REGISTRY_IMAGE = "docker.io/rakshashenoy/ng:${BUILD_NUMBER}"
        // SONAR_PROJECT_KEY = 'new-demo-jenkins'
        // DOCKER_REGISTRY = 'https://hub.docker.com/r/rakshashenoy/keer'
        registryCredential = 'DOCKER_CREDENTIAL'
        // ARGO_ADMIN = "credentials('argo-cred').username"
        // ARGO_PASS = "credentials('argo-cred').password"
        // ARGOSERVER = "http://localhost:9000"
      
    }

    stages {
        // stage('Set Alias') {
        //     steps {
        //         script {
        //             // Set the alias for this session
        //             bat "set podman=docker"
        //         }
        //     }
        // }
        // stage('SonarQube Scan') {
        //     steps {
        //         script{
        //             // def props = readProperties file: 'sonar-project.properties'
        //             withSonarQubeEnv('sonar') {
        //                 bat "${SCANNER_HOME}/bin/sonar-scanner -Dsonar.projectKey=${SONAR_PROJECT_KEY}" 

        //             }
        //         }
        //     }
        // }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using Docker Pipeline plugin
                    // dockerImage = docker.build("${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_PATH} .")
                    // bat "podman machine init"
                    // bat "podman machine start"
//                     withEnv(["DOCKER_HOST=unix:///run/podman/podman.sock"]) {
//                        bat "podman build -t ${DOCKER_IMAGE_NAME} ."
// }

                    // bat "podman build -t ${DOCKER_IMAGE_NAME} ."
                    // bat "podman build -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} ."
                    // bat "podman run --rm ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
                    // bat "podman --version"
                    // bat "podman build -f ${DOCKERFILE_PATH} -t ${DOCKER_IMAGE_NAME} ."
                    // bat "podman images"
                    //docker.tag dockerImage:latest docker.io/rakshashenoy/keer:latest
                    // docker.tag(dockerImage, 'rakshashenoy/samplerepo/keer:latest')
                    bat "docker build -t ${DOCKER_IMAGE_NAME} ."
                    bat "docker images"

                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Build Docker image using Docker Pipeline plugin
                    docker.withRegistry( 'https://docker.io', registryCredential) { 
                     // Tag the Docker image
                    bat "docker tag ${DOCKER_IMAGE_NAME} ${REGISTRY_IMAGE}"
                    // dockerImage.push()nnn
                    // bat "docker push rakshashenoy/keer:tagname"
                    // bat "docker push ${dockerImage}"
                    bat "docker push ${REGISTRY_IMAGE}"
                    }
                }
            }
        }
        // stage('Login to Docker Hub') {
        //     steps {
        //         script {
        //             // Login to Docker Hub using credentials stored in Jenkins
        //             withCredentials([usernamePassword(credentialsId: 'DOCKER_CREDENTIAL', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
        //                 bat "podman login --username ${DOCKER_USERNAME} --password ${DOCKER_PASSWORD} docker.io"
        //             }
        //         }
        //     }
        // }

        // stage('Push Image to Docker Hub') {
        //     steps {
        //         script {
        //             // Push the image to Docker Hub
        //              bat "podman tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"

        //             // Push the tagged image to Docker Hub using Podman
        //              bat "podman push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
        //             // bat "podman tag ${IMAGE_NAME} ${REGISTRY_IMAGE}"
        //             // bat "podman push ${REGISTRY_IMAGE}"
                    
        //         }
        //     }
        // }
    }
}
