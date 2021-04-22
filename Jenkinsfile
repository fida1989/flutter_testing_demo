pipeline {
    agent any
    stages {
        stage ('Run Flutter Tests') {
            steps {
                sh "flutter drive --target=test_driver/app.dart"
            }
        }
    }
}