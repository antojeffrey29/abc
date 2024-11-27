pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/antojeffrey29/abc.git'
            }
        }
        stage('Initialize Terraform') {
            steps {
                script {
                try {
                    sh 'terraform init'
                } catch (Exception e) {
                    error "Terraform initialization failed: ${e.message}"
                }
        }
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
    post {
        always {
            cleanWs() // Cleans up the workspace
        }
    }
}