
node {
  
  stages {
// Building your  Images
    stage('BUILD') {
      parallel {
        stage('Express Image') {
          steps {
            sh 'docker build -f test.dockerfile -t mosaiq .'
          }
        }
      }
      post {
        failure {
            echo 'This build has failed. See logs for details.'
        }
      }
    }
  }
