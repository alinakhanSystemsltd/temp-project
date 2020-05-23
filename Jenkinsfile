
node {
  
    parallel (
     phase1: { sh "docker run test ./runner.sh
" },

     phase3: { sh "echo p3; sleep 5s; echo Static analyse done!" }

   
  )
}
