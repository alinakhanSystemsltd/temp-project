node {
  
  stage 'Compiling'
  //docker.image('ubuntu:18.04').inside {
  //   runCmd echo "hello Midend"
  

      parallel (
     mphase1: { sh "echo p1; sleep 20s; docker.image('runtime-tooling').withRun('-p 8081:8081 --name runtime')" },

     phase2: { sh "echo p2; sleep 10s; echo All tests are successed!" },

     phase3: { sh "echo p3; sleep 5s; echo Static analyse done!" },

     phase4: { sh "echo p4; sleep 7s; echo Formal analyse done!" },

     phase5: { sh "echo p5; sleep 10s; echo Dynamic analyse done!" },

     phase6: { sh "echo p6; sleep 30s; echo Conan packages are ready!" },

     phase7: { sh "echo p7; sleep 20s; echo All reports have been created!" },

     phase8: { sh "echo p8; sleep 31s; sh runner.sh" }
   
  )
}
