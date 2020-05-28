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

        stage('Release') {
          steps {
             sh 'mkdir ../build-release \
                && cd ../build-release \
                && cmake'
          }
        }
        stage('Debug') {
          steps {
             sh 'mkdir ../build-debug \
                && cd ../build-debug \
                && cmake'
          }
        }
        stage('Tests') {
          steps {
             sh 'mkdir ../build-tests \
                && cd ../build-tests \
                && cmake'
          }
        }
        stage('Static analysis') {
          steps {
             sh 'mkdir ../build-static \
                && cd ../build-static \
                && cmake'
          }
        }

        stage('Formal analysis') {
          steps {
              sh 'mkdir ../build-formal \
                && cd ../build-format \
                && cmake'
          }
        }
        stage('Dynamic analysis') {
          steps {
              sh 'mkdir ../build-dynamic \
                && cd ../build-dynamic \
                && cmake'
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