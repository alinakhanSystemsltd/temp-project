node {
   git "https://github.com/Celcis/clang_10_in_docker.git"
   parallel (
     phase1: { sh "echo p1; sleep 20s; echo Release binary done!" },

     phase2: { sh "echo p2; sleep 10s; echo All tests are successed!" },

     phase3: { sh "echo p2; sleep 5s; echo Static analyse done!" },

     phase4: { sh "echo p2; sleep 7s; echo Formal analyse done!" },

     phase5: { sh "echo p2; sleep 10s; echo Dynamic analyse done!" },

     phase6: { sh "echo p2; sleep 30s; echo Conan packages are ready!" },

     phase3: { sh "echo p2; sleep 20s; echo All reports have been created!" },

     phase7: { sh "echo p3; sleep 17s; sh runner.sh" }
   )
  
}
