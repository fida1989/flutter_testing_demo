pipeline {
    agent any
    stages {
      stage ('Checkout') {
            steps {
                checkout scm
            }
        }
        stage ('Flutter init') {
            steps {
                 echo "Running flutter doctor"
                 sh "flutter doctor"
            }
        }
        stage('Clean project') {
            steps {
                sh 'flutter clean'
            }
         }
        stage('Update dependencies') {
            steps {
                sh 'flutter packages get'
            }
        }
        stage ('Run Flutter Tests') {
            steps {
                sh "flutter drive --target=test_driver/app.dart"
            }
        }
    }
}