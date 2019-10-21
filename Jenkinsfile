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
            sh '''
curl \'https://testing.sweagle.com/api/v1/data/ml/recognize?downLimit=100\' --data "path=WebApp,Environments" --header "authorization: bearer 783d4f5b-c260-4cce-936e-00d2483875ab" '''
          }
        }
      }
    }
    stage('Validation') {
      parallel {
        stage('Validation') {
          steps {
            SWEAGLEValidate(actionName: 'ValidateConfig', mdsName: 'Client-TST', showResults: true, retryInterval: 5, markFailed: true, errMax: 5)
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