pipeline {
  agent any
  stages {
    stage('build docker image') {
      steps {
        sh 'sudo docker build . -t boltpius/femiproject:latest '
      }
    }

  }
}