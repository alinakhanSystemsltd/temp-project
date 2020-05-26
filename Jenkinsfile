pipeline {
  agent {
    docker {
      image 'runtime-tooling'
      }
  }
  stages {
// Building your  Images
    stage('QA') {
      parallel {
        stage('Tests') {
          steps {
             sh ' echo building'
            
          }
        }
        stage('Static analysis') {
          steps {
             sh 'cmake --version'
          }
        }

        stage('Formal analysis') {
          steps {
              sh 'cmake --version'
          }
        }
        stage('Dynamic analysis') {
          steps {
              sh 'cmake --version'
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
            sh 'cmake --version'
             sh 'ninja --version'
          }
        }
      }
    }
  }
}
