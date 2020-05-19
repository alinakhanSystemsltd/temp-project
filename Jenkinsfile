node {
  
  stage 'Compiling'
  //docker.image('ubuntu:18.04').inside {
  //   runCmd echo "hello Midend"
  

      parallel (
     phase1: { sh "docker run runtime-tooling | clang --version
 " },

     phase2: { sh "docker run runtime-tooling | cmake --version
" },

     phase3: { sh "echo p3; sleep 5s; echo Static analyse done!" },

   
  )
}
