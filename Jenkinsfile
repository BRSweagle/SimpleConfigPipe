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
            sh '''cd /Users/boondock/Documents/Technical/CLI/SCLI

./sweagle uploadData -f /Users/boondock/Documents/GitHub/SimpleConfigPipe/Client-TST.json -n WebApp,Client,TST -t json -a'''
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