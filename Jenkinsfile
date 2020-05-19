node {
  def runCmd = { cmd ->
<<<<<<< HEAD
        sh "docker run -v /var/run/docker.sock:/var/run/docker.sock  runtime-tooling ${cmd}"
=======
        sh "docker run --rm  runtime-tooling ${cmd}"
>>>>>>> bb0cc460e79470aeb151a31dc153d71dd55ecc50
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
