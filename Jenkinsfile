node {
  
  stage 'Compiling'
  docker.image('runtime-tooling').inside {
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
