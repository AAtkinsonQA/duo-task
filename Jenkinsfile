pipeline {
  agent any
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
    stage('deploy on other vm') {
      steps {
        sh 'chmod +x deploy.sh'
        sh './deploy.sh'
      }
    }
  }
}
