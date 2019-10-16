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
        SWEAGLEUpload(actionName: 'UploadConfig', fileLocation: '/Users/boondock/Documents/GitHub/SimpleConfigPipe/', format: 'JSON', nodePath: 'NewNode')
      }
    }
  }
}