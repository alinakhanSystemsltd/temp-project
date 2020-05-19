node {
  
  stage 'Compiling'
  //docker.image('ubuntu:18.04').inside {
  //   runCmd echo "hello Midend"
  

      parallel (
     phase1: { sh "docker exec jenkins bash | docker run  runtime-tooling | conan --version" },

     phase3: { sh "echo p3; sleep 5s; echo Static analyse done!" }

   
  )
}
