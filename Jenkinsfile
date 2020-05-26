pipeline {
  agent any
  stages {
// Building your  Images
    stage('BUILD') {
      //paralelized stags
      parallel {
        stage('Express Image') {
          steps {
            sh 'docker build -f test.dockerfile -t mosaiq_tt .'
            
            sh 'docker run mosaiq_tt cmake --version'
          }
        }

        stage('Release-Stage') {
          steps {
            
            
            sh 'docker run runtime-tooling cmake --version'
          }
        }

     }


          post {
        failure {
            echo 'This build has failed. See logs for details.'
        }
      }
    }

    stage('TEST'){
      parallel {
        stage('test') {
          steps {
            sh 'echo Running Sanitizer'
          }
        }
        stage('Sanitizer') {
          steps {
            sh 'echo Running Sanitizer'
          }
        }
      }
    }
  }
}
