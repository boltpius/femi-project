pipeline {
  agent any
  stages {
    stage('aws cli') {
      steps {
        sh 'aws --version '
      }
    }

    stage('aws ecr login') {
      steps {
        sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/a0i7l2w3'
      }
    }

    stage('build docker image') {
      steps {
        sh 'docker build . -t femi.project'
      }
    }

    stage('tag and push to ecr ') {
      steps {
        sh '''docker tag femi.project:latest public.ecr.aws/a0i7l2w3/femi.project:latest
docker push public.ecr.aws/a0i7l2w3/femi.project:latest
'''
      }
    }
    stage('Build and Deploy') {
            steps {
                script {
                    // Use AWS_ACCESS_KEY_ID securely in your pipeline
                    sh "aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID"
                    sh "aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY"
                    // Your AWS-related commands here
                }
            }
        }

  }
  environment {
    pius = 'pius'
    AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY').toString()
  }
}
