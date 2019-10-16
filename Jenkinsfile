pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            echo 'Build Started'
          }
        }
        stage('UploadConfig') {
          steps {
            echo 'ConfigUploaded'
            sh '''CD /Users/boondock/Documents/GitHub/SimpleConfigPipe

git pull'''
          }
        }
        stage('') {
          steps {
            SWEAGLEUpload(actionName: 'Upload', fileLocation: '/Users/boondock/Documents/GitHub/SimpleConfigPipe/Client-TST.json', format: 'json', nodePath: 'WebApp,Client', description: 'DataUpload', showResults: true)
          }
        }
      }
    }
    stage('Config') {
      parallel {
        stage('Config') {
          steps {
            SWEAGLEExport(actionName: 'GetLatestConfig', mdsName: 'Client-TST', fileLocation: '/Users/boondock/Documents/GitHub/SimpleConfigPipe/Client-TST.json', exporter: 'all', format: 'json')
          }
        }
        stage('error') {
          steps {
            echo 'Data Downloaded'
          }
        }
      }
    }
    stage('Validation') {
      parallel {
        stage('Validation') {
          steps {
            SWEAGLEValidate(actionName: 'ValidateConfig', mdsName: 'Client-TST', errMax: 1, markFailed: true, showResults: true)
          }
        }
        stage('Test Bed Execution') {
          steps {
            echo 'Testing Completed'
            sleep 3
          }
        }
        stage('Performance Tests') {
          steps {
            fileExists '/Users/boondock/Documents/GitHub/SimpleConfigPipe/Client-TST.json'
          }
        }
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploy to PRE'
      }
    }
  }
}