pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
        git branch: 'main',
            url: 'https://github.com/MANOJKUMAR0345/Jenkins-01.git'
    }
}
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins-01 .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker stop jenkins-01-container || true
                docker rm jenkins-01-container || true
                docker run -d -p 80:80 --name jenkins-01-container jenkins-01
                '''
            }
        }
    }
}

