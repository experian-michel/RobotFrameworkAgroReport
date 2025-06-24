pipeline {
    agent any

    environment {
        VENV_DIR = ".venv"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git'
            }
        }
        stage('Setup Python venv') {
            steps {
                sh 'python3 -m venv ${VENV_DIR}'
                sh '. ${VENV_DIR}/bin/activate && pip install --upgrade pip'
            }
        }
        stage('Install dependencies') {
            steps {
                sh '. ${VENV_DIR}/bin/activate && pip install -r requirements.txt'
            }
        }
        stage('Lint Robot Framework') {
            steps {
                sh '. ${VENV_DIR}/bin/activate && robocop resources/ tests/'
            }
        }
        stage('Run Robot Tests') {
            steps {
                sh '. ${VENV_DIR}/bin/activate && robot -d results tests/'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'results/**'
            junit 'results/output.xml'
        }
        failure {
            slackSend channel: '#seu-canal', message: "Build falhou no projeto AgroReport!"
        }
        success {
            slackSend channel: '#seu-canal', message: "Build passou no projeto AgroReport!"
        }
    }
}