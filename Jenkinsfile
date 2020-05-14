node {
   git "https://github.com/Celcis/clang_10_in_docker.git"
   parallel (
     phase1: { sh "echo p1; sleep 30s; echo I am also done" },
     phase2: { sh "echo p2; sleep 10s; echo I am done" }
   )
  sh "tested"   
}
