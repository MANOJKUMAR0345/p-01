pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
<<<<<<< HEAD
                sh 'docker build -t p-01-frontend .'
=======
                sh 'docker build -t p-01 .'
>>>>>>> 08e8585bff4d6c78e0097c62bcd10bd84cf69754
            }
        }

        stage('Run Container') {
            steps {
                sh '''
<<<<<<< HEAD
                docker stop p-01-frontend || true
                docker rm p-01-frontend || true
                docker run -d -p 8080:80 --name p-01-frontend p-01-frontend
=======
                docker stop p-01-container || true
                docker rm p-01-container || true
                docker run -d -p 8080:80 --name p-01-container p-01
>>>>>>> 08e8585bff4d6c78e0097c62bcd10bd84cf69754
                '''
            }
        }
    }
}
