pipeline {
  agent any
  stages {
    stage('build docker image') {
      steps {
        sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/a0i7l2w3'
      }
    }

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

  }
}