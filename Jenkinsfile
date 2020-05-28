import com.encoway.mosaiq.runtime.*;
pipeline {
  agent {
    docker {
      image 'runtime-tooling'
      args '-v ${PWD}:/app -w :/app'
      //args '--mount type=bind,source="$(pwd)"/temp-project,target=/app'
      reuseNode true
      }
  }
  stages {
    stage('QA') {
      parallel {
        stage('Tests') {
          steps {
             sh 'conan --version'
          }
        }
        stage('Static analysis') {
          steps {
             sh 'echo static'
          }
        }

        stage('Formal analysis') {
          steps {
              sh 'echo formal'
          }
        }
        stage('Dynamic analysis') {
          steps {
              sh 'echo dynamic'
          }
        }

     }
          post {
        failure {
            echo 'This build has failed. See logs for details.'
        }
      }
    }

    stage('DEPLOYMENT'){
      parallel {
        stage('Result') {
          steps {
            sh 'echo Reporting...'
          }
        }
        stage('Deploy Conan Artifacts') {
          steps {
             sh 'cmake --version'
             sh 'ninja --version'
          }
        }
      }
    }
  }
}