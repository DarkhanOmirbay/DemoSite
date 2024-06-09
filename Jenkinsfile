pipeline {
    agent any
    stages {
        stage('Build maven project') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/DarkhanOmirbay/DemoSite']])
                sh './mvnw clean install'
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t darkhanomirbay/devops-integration .'
                }
            }
        }
        stage('Push image to Docker Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u domirbai04@gmail.com -p ${dockerhubpwd}'
}
                    sh 'docker push darkhanomirbay/devops-integration'
                }
            }
        }
    }
}
