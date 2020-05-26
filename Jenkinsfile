pipeline {
  agent any
  stages {
// Building your  Images
    stage('BUILD') {
      //paralelized stags
      parallel {
        stage('Build Docker Image') {
          steps {
            sh 'docker build -f test.dockerfile -t mosaiq_tt .'
            
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
        stage('Tests') {
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

    stage('DEPLOY'){
      parallel {
        stage('Reports') {
          steps {
            sh 'echo Reporting...'
          }
        }
        stage('Conan Artifacts') {
          steps {
            sh 'echo upload  the artifacts'
          }
        }
      }
    }
  }
}
