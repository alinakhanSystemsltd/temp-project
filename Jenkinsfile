
node {
  
    parallel (
     phase1: { sh "docker run cmake cmake --version" },

     phase3: { sh "echo p3; sleep 5s; echo Static analyse done!" },
     
     phase3: { sh "docker run runnerimg sh runner.sh" },
     phase3: { sh "Pipeline is done!" }
      

   
  )
}
