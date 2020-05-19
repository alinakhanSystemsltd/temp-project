node {
  
  stage 'Compiling'
  docker.image('ubuntu:18.04').inside {
     runCmd echo "hello Midend"
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
