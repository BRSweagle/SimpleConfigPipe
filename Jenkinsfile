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
        SWEAGLEUpload(actionName: 'UploadConfig', fileLocation: 'https://github.com/BRSweagle/SimpleConfigPipe/blob/master/config.json', format: 'json', nodePath: 'Jenkins')
      }
    }
  }
}