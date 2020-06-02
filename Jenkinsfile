pipeline {

    environment {
        CONAN_USE_ALWAYS_SHORT_PATHS = 'True'; 
        CONAN_USER_HOME = "${env.WORKSPACE}/"
        CONAN_NON_INTERACTIVE = 1
    } 

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
                && cmake /var/lib/jenkins/workspace/temp-project &&  make \
                &&  ../bin/mosaiqruntimeprojectname'
          }
        }
        stage('Debug') {
          steps {
             sh 'echo debug'
          }
        }
        stage('Tests') {
          steps {
            sh 'echo debug'
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
           //  sh 'conan remote add mosaiq-local http://localhost:8082/artifactory/api/conan/mosaiq-local'
           //  sh 'conan upload "" -r=mosaiq-local -c'
           sh 'conan --version'
          }
        }
      }
    }
  }
}
