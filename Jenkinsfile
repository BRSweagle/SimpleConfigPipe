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
        stage('GetGit') {
          steps {
            echo 'ConfigUploaded'
            sh '''cd /Users/boondock/Documents/GitHub/SimpleConfigPipe

git pull'''
          }
        }
        stage('UploadConfig') {
          steps {
            sh '''cd /Users/boondock/Documents/GitHub/SimpleConfigPipe
./uploadFileToSweagle.sh WebApp,Client Client-TST.json'''
          }
        }
        stage('Upload') {
          steps {
            SWEAGLEUpload(actionName: 'UploadData', fileLocation: '/Users/boondock/Documents/GitHub/SimpleConfigPipe/Client-TST.json', format: 'JSON', nodePath: 'Testing', description: 'Upload', showResults: true, markFailed: true)
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
            SWEAGLEValidate(actionName: 'ValidateConfig', mdsName: 'Client-TST', errMax: 1, markFailed: true, showResults: true, retryInterval: 5)
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