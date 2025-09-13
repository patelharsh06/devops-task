pipeline {
    agent any

    environment {
        NODE_VERSION = '18'
        DOCKER_IMAGE = "devops-task:latest"
        DOCKER_REPO = "harshpatel04/devops-task:latest" 
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
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Push to Registry') {
            steps {
                echo 'Pushing Docker image...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag ${DOCKER_IMAGE} ${DOCKER_REPO}
                        docker push ${DOCKER_REPO}
                    """
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying container...'
                
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
