pipeline {
    agent any

    stages {
        stage('Build and Test') {
            steps {
                sh './build_and_test.sh'
            }
        }
    }

    post {
        success {
            echo 'Build and tests succeeded! Deploying...'
            // Add deployment steps here
        }
        failure {
            echo 'Build or tests failed. Not deploying.'
        }
    }
}
