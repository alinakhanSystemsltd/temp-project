node {
  def runCmd = { cmd ->
        sh "docker run --rm -v /home/mn:/src/mn ubuntu:latest ${cmd}"
    }
  
  stage 'Build'
  runCmd 'npm install'
  parallel (
    "frontend": {
      runCmd "make frontend"
    },
    "backend": {
      runCmd "make backend"
    }
  )
}