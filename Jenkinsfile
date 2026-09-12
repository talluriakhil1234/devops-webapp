pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-southeast-2'
        ECR_REGISTRY = '952618422790.dkr.ecr.ap-southeast-2.amazonaws.com'
        ECR_REPOSITORY = 'devops-webapp'
        IMAGE_TAG = '1.0'
    }

    stages {

        stage('Build') {
            steps {
                sh '''
                    export JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto.x86_64
                    mvn clean package
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    docker build \
                    -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
                '''
            }
        }

        stage('ECR Push') {
            steps {
                sh '''
                    aws ecr get-login-password --region $AWS_REGION | \
                    docker login --username AWS --password-stdin $ECR_REGISTRY

                    docker push \
                    $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
                '''
            }
        }
    }
}