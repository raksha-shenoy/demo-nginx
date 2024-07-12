pipeline {
    agent any

    environment {
        // Define environment variables if needed
        DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\demo-nginx\\Dockerfile' // Update this with your Dockerfile path
        DOCKER_IMAGE_TAG = 'nginx:latest' // Update with your desired image name and tag
    }

    stages {
        // stage('Checkout') {
        //     steps {
        //         // Checkout the code from Git
        //         git 'https://github.com/raksha-shenoy/new-demo-jenkins.git'
        //     }
        // }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using Docker Pipeline plugin
                    docker.build("${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_PATH} .")
                }
            }
        }
        stage('trivy'){
            steps{
                script{
                    bat 'docker run -v //var//run//docker.sock://var//run//docker.sock -v $HOME//Library//Caches://root//.cache// aquasec//trivy:0.53.0 image nginx:latest'
               }
            }
        }
        
    }
}