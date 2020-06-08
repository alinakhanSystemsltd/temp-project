pipeline {

    environment {
        CONAN_USER_HOME = "${env.WORKSPACE}/"
        CONAN_NON_INTERACTIVE = 1
      
    } 

  agent {
    docker {
      image 'runtime-tooling'
      args '-v ${PWD}:/mosaiq-app -w :/mosaiq-app:ro'
    
      reuseNode true
      }
  }
  stages {
    stage('QA') {
      parallel {

         stage('Release') {
          steps {
              
              sh "mkdir -p /tmp/build-release"
              sh "cd /tmp/build-release"
              sh "cmake -DCMAKE_BUILD_TYPE=Release /var/lib/jenkins/workspace/${env.JOB_NAME} && cmake --build .  "

          }
        } 
         stage('Tests-Release') {
          steps {
              
              sh "cd /tmp/build-release/bin/ && ./mosaiqruntimeprojectname " 
              sh "cd /tmp/build-release/bin/ && ./mosaiqruntimeprojectname-tests "   
          }
        } 

         stage('Address Sanitizer') {
          steps {
            
              
              sh " mkdir -p /tmp/build-sanitizer "
              sh " cd /tmp/build-sanitizer"
              sh " cmake -fsanitize=address /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build ."
          }
        } 

        stage('Memory Sanitizer') {
          steps {
                         
              sh " mkdir -p /tmp/build-mem-sanitizer "
              sh " cd /tmp/build-mem-sanitizer" 
              sh " cmake -fsanitize=memory /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build ."
          }
        }  

        stage('Memory Sanitizer') {
          steps {
                         
              sh " mkdir -p /tmp/build-dynamic "
              sh " cd /tmp/build-dynamic" 
              sh " cmake -fsanitize=memory /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build ."
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
