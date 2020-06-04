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
      args '-v ${PWD}:/app -w :/app:ro'
    
      reuseNode true
      }
  }
  stages {
    stage('QA') {
      parallel {

         stage('Release') {
          steps {
             sh "mkdir -p /tmp/build-release \
                && cd /tmp/build-release \
                && cmake -DCMAKE_BUILD_TYPE=Release /var/lib/jenkins/workspace/${env.JOB_NAME} && cmake --build .  \
                && cd /tmp/build-release/bin/ \
                && ./mosaiqruntimeprojectname "
          }
        } 
        stage('Debug') {
          steps {
          
              sh "mkdir -p /tmp/build-debug \
                && cd /tmp/build-debug \
                && cmake  -DCMAKE_BUILD_TYPE=Debug /var/lib/jenkins/workspace/${env.JOB_NAME} && cmake --build .  \
                && cd /tmp/build-debug/bin/ \
                && ./mosaiqruntimeprojectname " 
                }
        }
         stage('Tests') {
          steps {
             sh "mkdir -p /tmp/build-test \
                && cd /tmp/build-test \
                && cmake /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build .\
                && cd /tmp/build-test/bin/ \
                && ./mosaiqruntimeprojectname-tests " 
          }
        } 

        stage('Address Sanitizer') {
          steps {
              
             sh " mkdir -p /tmp/build-sanitizer \
                && cd /tmp/build-sanitizer \
                && cmake -fsanitize=address /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build .\
                && cd /tmp/build-sanitizer/bin/ \
                && ./mosaiqruntimeprojectname " 
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
        /*  stage('Deploy Conan Artifacts') {
          steps {
              
              
             
              sh "conan remote add mosaiq-local http://192.168.1.221:8082/artifactory/api/conan/mosaiq-local"
              sh "conan user ${CONAN_USER_NAME} -p ${CONAN_PASSWORD} -r=mosaiq-local"
              sh 'conan upload "" -r=mosaiq-local -c'
            
          }
        }  */
      }
    }
  }
}
