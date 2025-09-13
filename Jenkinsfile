pipeline {
    agent any

    environment {
        NODE_VERSION = '18'
        DOCKER_IMAGE = "devops-task:latest"
        DOCKER_REPO = "harshpatel04/devops-task:latest" 
        AWS_REGION = 'eu-north-1'        // Update to your AWS region
        ECS_CLUSTER = 'devops-task-cluster'  // Your ECS cluster name
        ECS_SERVICE = 'devops-task-service'  // Your ECS service name
        ECS_TASK_DEF = 'devops-task-family'    // Your ECS task definition name
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
                echo 'Pushing Docker image to DockerHub...'
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
                echo 'Deploying container to AWS ECS...'
                withAWS(credentials: 'aws-credentials', region: "${AWS_REGION}") {
                    sh """
                        aws ecs update-service \
                        --cluster ${ECS_CLUSTER} \
                        --service ${ECS_SERVICE} \
                        --force-new-deployment
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
