
node {
  
    parallel (
     phase1: { sh "docker run 0e2e80c1bc26 | sh runner.sh
" },

     phase3: { sh "echo p3; sleep 5s; echo Static analyse done!" }

   
  )
}
