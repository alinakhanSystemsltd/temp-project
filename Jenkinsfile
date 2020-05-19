node {
  def runCmd = { cmd ->
        sh "docker run -v /var/run/docker.sock:/var/run/docker.sock  runtime-tooling ${cmd}"

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
