pipeline {
    //environment {
      //DOCKER = credentials('docker-hub')
    //}
  agent any
  stages {
// Building your  Images
    stage('BUILD') {
      parallel {
        stage('Express Image') {
          steps {
            sh 'docker build -f test.dockerfile -t mosaiq_tt .'
          }
        }
      }
  

    stage('second step') {
          steps {
            sh 'docker run mosaiq_tt cmake --version'
          }
        }
      }

          post {
        failure {
            echo 'This build has failed. See logs for details.'
        }
      }
    }
}
