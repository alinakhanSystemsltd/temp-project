pipeline {
  agent any
  stages {
    stage('QA') {
      steps {
        sh '''mkdir -p /tmp/build-release \\
             && cd /tmp/build-release \\
             && cmake -DCMAKE_BUILD_TYPE=Release  /var/lib/jenkins/workspace/${env.JOB_NAME} && cmake --build .  \\ '''
      }
    }

  }
}