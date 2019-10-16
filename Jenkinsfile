pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build Started'
      }
    }
    stage('Config') {
      steps {
        SWEAGLEUpload(actionName: 'UploadConfig', fileLocation: '/Users/boondock/.jenkins/workspace/SimpleConfigPipe_master/config.json', format: 'JSON', nodePath: 'NewNode')
      }
    }
  }
}