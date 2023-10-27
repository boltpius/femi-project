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
        sh '''withCredentials([[$class: \'AmazonWebServicesCredentialsBinding\', credentialsId: \'6d2fcc57-4555-43a5-be5c-8e71e06ff80d\', accessKeyVariable: \'AWS_ACCESS_KEY_ID\',secretKeyVariable: \'AWS_SECRET_ACCESS_KEY\']]) AWS("--region=eu-west-1 ")
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/a0i7l2w3'''
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

  }
  environment {
    pius = 'pius'
    AWS_ACCESS_KEY_ID = credentials('aws_access_key')
    AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
  }
}