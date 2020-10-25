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
               sh "echo Release is building..."
               sh " mkdir -p /tmp/build-release "
               sh " cd /tmp/build-release && cmake -DCMAKE_BUILD_TYPE=Release /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build . "
               sh  "conan search && conan remote list "                  
          }
          environment {
            CONAN_USER_HOME = "/tmp/build-release"
            CONAN_NON_INTERACTIVE = 1
           }  
        } 
         stage('Address Sanitizer') {
          steps {              
              sh " mkdir -p /tmp/build-sanitizer "
              sh " cd /tmp/build-sanitizer && cmake -fsanitize=address -fno-optimize-sibling-calls -fsanitize-address-use-after-scope -fno-omit-frame-pointer -g -O1 /var/lib/jenkins/workspace/${env.JOB_NAME} &&  cmake --build ."
          }
          environment {
      
            CONAN_USER_HOME = "/tmp/build-sanitizer"
            CONAN_NON_INTERACTIVE = 1
           } 
        } 
         
      }
}
 
      }
}