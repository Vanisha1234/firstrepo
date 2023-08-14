pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                script {
                    def dockerImage = docker.build('my-node-app:latest', '.')
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'npm start'
                    }
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}
