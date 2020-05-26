
node {
  
  stages{
    parallel {
      stage('Build')
       steps {
           phase1: { sh 'docker build -f test.dockerfile -t mosaiq .' },

           phase2: { sh 'mkdir build && cd build' },

           phase3: { sh "echo p3; sleep 5s; echo Static analyse done!" }
   }      
 }
}
    post {
      failure {
      echo 'This build has failed. See logs for details.'
    }
  }
}
