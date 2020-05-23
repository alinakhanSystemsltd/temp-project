
node {
  
    parallel (
     phase1: { sh "docker run cmake cmake --version" },

     phase3: { sh "echo p3; sleep 5s; echo Static analyse done!" }

   
  )
}
