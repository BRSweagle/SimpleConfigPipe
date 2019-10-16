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
        SWEAGLEExport(actionName: 'GetLatestConfig', mdsName: 'Client-TST', fileLocation: '/Users/boondock/Documents/GitHub/SimpleConfigPipe/Client-TST.json', exporter: 'all', format: 'json')
      }
    }
  }
}