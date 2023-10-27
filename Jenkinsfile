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

    stage('ssh') {
      steps {
        sh '''ssh  -o StrictHostKeyChecking=no ubuntu@54.195.23.30

'''
      }
    }

  }
  environment {
    AWS_ACCESS_KEY_ID = 'AKIA2FK2QOWHFGB6GQQI'
    AWS_SECRET_ACCESS_KEY = '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'
  }
}