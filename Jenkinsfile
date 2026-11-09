pipeline {
    agent any

    environment {
        AWS_REGION = 'eu-north-1'
        AWS_ACCOUNT_ID = '732963826383'
        ECR_REPOSITORY = 'nodejs-app'
        IMAGE_TAG = "${BUILD_NUMBER}"
        ECR_REGISTRY = '732963826383.dkr.ecr.eu-north-1.amazonaws.com'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('nodejs-app') {
                    sh 'npm ci'
                }
            }
        }

        stage('Unit Tests') {
            steps {
                dir('nodejs-app') {
                    sh 'npm test'
                }
            }
        }

        stage('Lint') {
            steps {
                dir('nodejs-app') {
                    sh 'npm run lint'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    docker build \
                    -t ${ECR_REPOSITORY}:${IMAGE_TAG} \
                    ./nodejs-app
                '''
            }
        }

        stage('Trivy Security Scan') {
            steps {
                sh '''
                    trivy image \
                    --severity HIGH,CRITICAL \
                    --exit-code 1 \
                    ${ECR_REPOSITORY}:${IMAGE_TAG}
                '''
            }
        }

        stage('Push to Amazon ECR') {
            steps {
                sh '''
                    aws ecr get-login-password \
                    --region ${AWS_REGION} | \
                    docker login \
                    --username AWS \
                    --password-stdin ${ECR_REGISTRY}

                    docker tag \
                    ${ECR_REPOSITORY}:${IMAGE_TAG} \
                    ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}

                    docker push \
                    ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}
                '''
            }
        }
    }

    post {
        success {
            echo 'Jenkins CI/CD Pipeline completed successfully!'
        }
        failure {
            echo 'Jenkins CI/CD Pipeline failed. Check the stage logs.'
        }
    }
}
