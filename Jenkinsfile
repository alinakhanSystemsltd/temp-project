node {
  
  stage 'Compiling'
  docker.image('ubuntu:18.04').inside {
    sh runner.sh
  }
  parallel (
    "frontend": {
      runCmd echo "hello frontend"
    },
    "backend": {
       runCmd echo "hello frontend"
    }
  )
}
