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
        SWEAGLEUpload(actionName: 'UploadConfig', fileLocation: '/Users/boondock/Documents/GitHub/SimpleConfigPipe/config.json', format: 'json', nodePath: 'NewNode', description: 'UploadedData')
      }
    }
  }
}