pipeline {
    stages {
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