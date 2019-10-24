pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            echo 'Build Start'
          }
        }
        stage('GetGit') {
          steps {
            echo 'ConfigUploaded'
            sh '''cd /Users/boondock/Documents/GitHub/SimpleConfigPipe

touch test1.txt'''
          }
        }
        stage('Upload') {
          steps {
            SWEAGLEUpload(actionName: 'UploadData', fileLocation: '/Users/boondock/Documents/GitHub/SimpleConfigPipe/Client-TST.json', format: 'JSON', nodePath: 'WebApp,WebClient', description: 'UploadViaJenkins', showResults: true, markFailed: true, tag: 'v1.${BUILD_ID}')
          }
        }
      }
    }
    stage('Test') {
      parallel {
        stage('Function Tests') {
          steps {
            echo 'StartFunctionalTests'
          }
        }
        stage('DataDownload') {
          steps {
            echo 'DownloadResults'
            sleep 5
          }
        }
        stage('MachineLearning') {
          steps {
            echo 'Start ML'
            echo 'ML - Node Types'
            sh '##https://testing.sweagle.com/api/v1/data/ml/recognize?downLimit=100&upLimit=0\' --data "path=WebApp,Environments,filip,data2" --header "authorization: bearer $aToken"'
          }
        }
      }
    }
    stage('Validation') {
      parallel {
        stage('Validation') {
          steps {
            SWEAGLEValidate(actionName: 'ValidateConfig', mdsName: 'Client-Jenkins', showResults: true, retryInterval: 5, markFailed: true)
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
        SWEAGLESnapshot(actionName: 'Snapshot', mdsName: 'Client-Jenkins', description: 'v1.${BUILD_ID}', tag: 'v1.${BUILD_ID}')
      }
    }
  }
}