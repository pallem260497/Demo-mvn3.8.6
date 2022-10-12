pipeline{
    agent any
    tools {
      git 'git'
      jdk 'jdk11'
      maven 'maven'
    }
    stages {
      stage('Checkout') {
        steps {
          git branch: 'main', url: 'https://github.com/pallem260497/Demo-mvn3.8.6.git'
        }
      }
      stage('mvn build') {
        steps {
           sh 'mvn clean package'
        }
      }
      stage('terraform') {
        steps {
          withAWS(credentials: 'awscredientialskeys', region: 'us-east-2') { 
            sh '''terraform init 
                  terraform plan
               '''
            }
        }
      }
   }
}
