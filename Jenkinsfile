pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1' 
        ECR_REPO = 'your-ecr-repository-url' 
        CLUSTER_NAME = 'your-ecs-cluster-name'
        SERVICE_NAME = 'your-ecs-service-name'
        TASK_DEFINITION_NAME = 'your-task-definition-name'
        CONTAINER_NAME = 'your-container-name'
    }

    stages {
        stage('Set Environment Variables') {
            steps {
                script {
                    env.IMAGE_TAG = "${BUILD_NUMBER}" 
                }
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Kunalkthalautiya/Project-1-Automated-CI-CD-Pipeline-AWS-ECS.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $ECR_REPO:$IMAGE_TAG .'  
            }
        }

        stage('Authenticate AWS ECR') {
            steps {
                sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO'
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh 'docker push $ECR_REPO:$IMAGE_TAG'  
            }
        }

        stage('Update ECS Task Definition') {
            steps {
                script {
                    sh '''
                    if aws ecs describe-task-definition --task-definition $TASK_DEFINITION_NAME >/dev/null 2>&1; then
                        echo "Existing task definition found, updating..."
                    else
                        echo "Task definition not found, creating a new one..."
                    fi

                    aws ecs describe-task-definition --task-definition $TASK_DEFINITION_NAME --query taskDefinition --output json \
                    | jq 'del(.taskDefinitionArn, .revision, .status, .requiresAttributes, .compatibilities, .registeredAt, .registeredBy)' \
                    > new-task-def.json

                    jq --arg IMAGE_URI "$ECR_REPO:$IMAGE_TAG" '.containerDefinitions[0].image = $IMAGE_URI' new-task-def.json > updated-task-def.json

                    aws ecs register-task-definition --cli-input-json file://updated-task-def.json
                    '''
                }
            }
        }

        stage('Deploy to ECS') {
            steps {
                sh '''
                NEW_TASK_REVISION=$(aws ecs describe-task-definition --task-definition $TASK_DEFINITION_NAME --query 'taskDefinition.revision' --output text)
                aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE_NAME --task-definition $TASK_DEFINITION_NAME:$NEW_TASK_REVISION
                '''
            }
        }
    }
}
