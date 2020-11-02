pipeline {
  agent any
  environment {
  }
  stages {
    stage('build images') {
      steps {
        sh 'sudo docker build -t lukebenson1/flask-app:1.0 .'
      }
    }
    stage('login and push to dockerhub') {
      steps {
        sh 'sudo docker login'
        sh 'sudo docker push lukebenson1/flask-app:1.0'
      }
    }
  }
}
