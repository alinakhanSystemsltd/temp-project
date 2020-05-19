node {
  
  stage 'Compiling'
  docker.image('ubuntu:18.04').inside {
    sh runner.sh
  }
  parallel (
    "frontend": {
      runCmd "cmake --version"
    },
    "backend": {
      runCmd "ninja --version"
    }
  )
}
