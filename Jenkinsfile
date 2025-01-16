pipeline {
    agent { label 'jenkins-agent' }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'python3 pipeline_script.py build'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'python3 pipeline_script.py test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'python3 pipeline_script.py deploy'
                }
            }
        }
    }
}
