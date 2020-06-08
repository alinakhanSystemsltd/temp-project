pipeline {

    environment {
        CONAN_USER_HOME = "${env.WORKSPACE}/"
        CONAN_NON_INTERACTIVE = 1
      
    } 

  agent {
    docker {
      image 'runtime-tooling'
      args '-v ${PWD}:/mosaiq-app -w :/mosaiq-app'
    
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
                && cmake -DCMAKE_BUILD_TYPE=Release /var/lib/jenkins/workspace/${env.JOB_NAME} && cmake --build .  "

          }
        } 
         stage('Tests') {
          steps {
                sh 'echo Sanitizer'
                sh "mkdir -p /tmp/build-test \
                && cd /tmp/build-test \
                && cmake /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build . "
               
          }
        } 

        stage('Address Sanitizer') {
          steps {
            sh 'echo Sanitizer'
              
             sh " mkdir -p /tmp/build-sanitizer \
                && cd /tmp/build-sanitizer \
                && cmake -fsanitize=address /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build ."
               /*  && cd /tmp/build-sanitizer/bin/ \
                && ./mosaiqruntimeprojectname   */
          }
        } 

        stage('Memory Sanitizer') {
          steps {
            sh 'echo Memory'
              
            /*  sh " mkdir -p /tmp/build-mem-sanitizer \
                && cd /tmp/build-mem-sanitizer \
                && cmake -fsanitize=memory /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build .\
                && cd /tmp/build-mem-sanitizer/bin/ \
                && ./mosaiqruntimeprojectname "  */
          }
        } 

          stage('Dynamic Analyzer') {
          steps {
            sh 'echo Dynamic'
              
            /*  sh " mkdir -p /tmp/build-mem-sanitizer \
                && cd /tmp/build-mem-sanitizer \
                && scan-build cmake /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build .\
                && cd /tmp/build-mem-sanitizer/bin/ \
                && ./mosaiqruntimeprojectname "  */
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
              sh 'echo Deployment part'     
             
            //  sh "conan remote add mosaiq-local http://192.168.1.221:8082/artifactory/api/conan/mosaiq-local"
            //  sh "conan user ${CONAN_USER_NAME} -p ${CONAN_PASSWORD} -r=mosaiq-local" 
            //  sh 'conan upload "" -r=mosaiq-local -c' 
            
          }
        }  
      }
    }
  }
}
