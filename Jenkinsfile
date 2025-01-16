pipeline {
    agent { label 'jenkins-agent' }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'python3 build.py build'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'python3 build.py test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'python3 build.py deploy'
                }
            }
        }
    }
}
