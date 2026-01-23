pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t p-01-frontend .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker stop p-01-frontend || true
                docker rm p-01-frontend || true
                docker run -d -p 8090:80 --name p-01-frontend p-01-frontend
                '''
            }
        }
    }
}
