pipeline {
    agent { label 'jenkins-agent' }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'python3 jenkins/jobs/build.py build'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'python3 jenkins/jobs/build.py test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'python3 jenkins/jobs/build.py deploy'
                }
            }
        }
    }
}
