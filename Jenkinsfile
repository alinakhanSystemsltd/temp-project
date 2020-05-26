
node {
  
  stages{
    parallel {
      stage('PRE_PROCESS')
       steps {
           phase1: { sh 'docker build -f Dockerfiles/dev_env.dockerfile -t mosaiq .' },

           phase2: { sh 'mkdir b' },
   }      
 }
}
    post {
      failure {
      echo 'This build has failed. See logs for details.'
    }
  }
}
