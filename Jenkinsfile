pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "simple-java-app:${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repo
                git branch: 'main', url: 'https://github.com/puppalashivasurya/new-project-repo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build & Trivy Scan') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
                sh "./trivy-scan.sh ${DOCKER_IMAGE}"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl apply -f k8s-deployment.yaml"
            }
        }
    }
}
