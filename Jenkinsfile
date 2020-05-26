pipeline {
  agent {
    docker {
      image 'runtime-tooling'
      args '-v ${PWD}:/app -w :/app readonly'
      reuseNode true 
      }
  }
  stages {
    // Here start quality assurance stage
    stage('QA') {
      parallel {
        stage('Tests') {
          steps {
             sh ' echo Testing'
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
// Here start deployment stage
    stage('DEPLOYMENT'){
      parallel {
        stage('Result') {
          steps {
            sh 'echo results are here'
          }
        }
        stage('Deploy Conan Artifacts') {
          steps {
             sh 'cmake --version'
             sh 'ninja --version'
          }
        }
      }
    }
  }
}
