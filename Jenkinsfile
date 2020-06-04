pipeline {

    environment {
        CONAN_USER_HOME = "${env.WORKSPACE}/"
        CONAN_NON_INTERACTIVE = 1
        CONAN_USER_NAME="test"
        CONAN_PASSWORD="12345678"
    } 

  agent {
    docker {
      image 'runtime-tooling'
      args '--network my-net -v ${PWD}:/app -w :/app'
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
                && cmake /var/lib/jenkins/workspace/deploy &&  make \
                && cd /tmp/build-release/bin/ \
                && ./mosaiqruntimeprojectname '
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
              
              //sh 'conan remote add mosaiq-local http://10.200.19.216:8082/artifactory/api/conan/mosaiq-local'
              sh 'conan user ${CONAN_USER_NAME} -p {CONAN_PASSWORD} -r=mosaiq-local'
              sh 'conan upload "" -r=mosaiq-local -c'
            
          }
        }
      }
    }
  }
}
