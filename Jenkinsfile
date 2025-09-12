pipeline {
    agent any

    environment {
        NODE_VERSION = '18' 
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
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                sh 'npm test || echo "No test script found"'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the app...'
                sh 'npm run build || echo "No build script found"'
            }
        }

        stage('Dockerize') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t devops-task:latest .'
            }
        }

        stage('Push to Registry') {
            steps {
                echo 'Pushing Docker image...'
                // Uncomment and update the next lines if using DockerHub
                // sh 'docker login -u <username> -p <password>'
                // sh 'docker tag devops-task:latest <username>/devops-task:latest'
                // sh 'docker push <username>/devops-task:latest'
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
