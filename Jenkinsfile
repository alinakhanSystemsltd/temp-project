node {
  def runCmd = { cmd ->
        sh "docker run --rm  runtime-tooling ${cmd}"
    }
  
  stage 'Compiling'
  runCmd 'clang --version'
  parallel (
    "frontend": {
      runCmd "cmake --version"
    },
    "backend": {
      runCmd "ninja --version"
    }
  )
}
