

pipeline {
  
  
  agent {


   docker {
      image 'runtime-tooling'
      args '-v ${PWD}:/tmp/mosaiq-project -w :/tmp/mosaiq-project:ro'
      reuseNode true
      }
  }
  stages {
    stage('QA') {
      parallel {

         stage('Release') {
 
            steps {
               sh "echo bla bla"
               sh " mkdir -p /tmp/build-release "
               sh " cd /tmp/build-release && cmake -DCMAKE_BUILD_TYPE=Release /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build . "
               sh  "conan search && conan remote list "
               
               //sh " cp /tmp/build-release/bin/mosaiqruntimeprojectname /var/lib/jenkins/workspace/${env.JOB_NAME}/mosaiqruntimeprojectname-release"
              
          }
          environment {
      
            CONAN_USER_HOME = "/tmp/build-release"
            CONAN_NON_INTERACTIVE = 1
           }  
        } 
        /* stage('Address Sanitizer') {
          steps {
            
              
              sh " mkdir -p /tmp/build-sanitizer "
              sh " cd /tmp/build-sanitizer && cmake -fsanitize=address -fno-optimize-sibling-calls -fsanitize-address-use-after-scope -fno-omit-frame-pointer -g -O1 /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build ."
          }

          environment {
      
            CONAN_USER_HOME = "/tmp/build-sanitizer"
            CONAN_NON_INTERACTIVE = 1
           } 
        } 
         

         stage('Memory Sanitizer') {
          steps {
                         
              sh " mkdir -p /tmp/build-mem-sanitizer "
              sh " cd /tmp/build-mem-sanitizer && cmake -fsanitize=memory -fno-optimize-sibling-calls -fsanitize-memory-track-origins=2 -fno-omit-frame-pointer -g -O2 /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build ."
          }

          environment {
      
            CONAN_USER_HOME = "/tmp/build-mem-sanitizer"
            CONAN_NON_INTERACTIVE = 1
           } 
        }  


         stage('Thread Sanitizer') {
          steps {
                         
              sh " mkdir -p /tmp/build-thr-sanitizer "
              sh " cd /tmp/build-thr-sanitizer && cmake -fsanitize=thread -g -O1  /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build ."
          }

          environment {
      
            CONAN_USER_HOME = "/tmp/build-thr-sanitizer"
            CONAN_NON_INTERACTIVE = 1
           } 
        }   */


 
     }
          post {
        failure {
            echo 'This build has failed. See logs for details.'
        }
      }
    }


     stage('Artifactory-Deployment') {
          parallel {


         stage('Packaging') {

            steps {

              sh " echo Building conan package..."
              sh " cd /tmp/build-release \
                  && conan search \
                  && conan remote list \
                  && conan upload '' -r=mosaiq-local -c \
                  && conan user test -p testtest "
                  
                  
              
          }
          environment {
      
            CONAN_USER_HOME = "/tmp/build-release"
            CONAN_NON_INTERACTIVE = 0
            CLANG_PROFILE="${WORKSPACE}/conan.profile"
           } 
        } 
      }
    }

  }
}
