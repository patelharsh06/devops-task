pipeline {
    agent any

    environment {
        NODE_VERSION = '18' // Node.js version
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', 
                    url: 'https://github.com/patelharsh06/devops-task.git',
                    credentialsId: 'github-credentials'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing Node.js dependencies...'
                bat 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                bat 'npm test'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the app...'
                // If you have a build command, e.g., npm run build
                bat 'npm run build || echo "No build script found"'
            }
        }

        stage('Dockerize') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t devops-task:latest .'
            }
        }

        stage('Push to Registry') {
            steps {
                echo 'Pushing Docker image...'
                // Replace with your DockerHub or AWS ECR login & push
                // bat 'docker tag devops-task:latest <username>/devops-task:latest'
                // bat 'docker push <username>/devops-task:latest'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying container...'
                // Add your deployment commands (AWS ECS / GCP Cloud Run)
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
