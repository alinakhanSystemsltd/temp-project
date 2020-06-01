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
             sh 'mkdir -p /tmp/build-release \
                && cd /tmp/build-release \
                && cmake /var/lib/jenkins/workspace/test1'
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
             sh 'echo Reporting...'
                       }
        }

        stage('Formal analysis') {
          steps {
               sh 'echo Reporting...'
          }
        }
        stage('Dynamic analysis') {
          steps {
               sh 'echo Reporting...'
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
