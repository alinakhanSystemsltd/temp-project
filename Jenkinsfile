node {
   git "https://github.com/Celcis/jenkins_parallel.git."
   parallel (
     phase1: { sh "echo p1; sleep 20s; echo phase1" },
     phase2: { sh "echo p2; sleep 40s; echo phase2" }
   )
  sh "run this after both phases complete"   
}
