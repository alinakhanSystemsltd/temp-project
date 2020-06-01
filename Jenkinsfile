pipeline {
  agent {
    docker {
      image 'runtime-tooling'
      args '-v ${PWD}:/app -w :/app'
      reuseNode true
      }
  }
  stages {
    stage('QA') {
      parallel {

        stage('Release') {
          steps {
             sh 'mkdir /tmp/build-release \
                && cd /tmp/build-release \
                && cmake /app'
          }
        }
        stage('Debug') {
          steps {
             sh 'mkdir build-debug \
                && cd build-debug'
          }
        }
        stage('Tests') {
          steps {
             sh 'mkdir build-tests'
          }
        }
        stage('Static analysis') {
          steps {
                       }
        }

        stage('Formal analysis') {
          steps {
              
          }
        }
        stage('Dynamic analysis') {
          steps {
              
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
             sh 'conan remote add mosaiq-local http://localhost:8082/artifactory/api/conan/mosaiq-local'
             sh 'conan upload "" -r=mosaiq-local -c'
          }
        }
      }
    }
  }
}
