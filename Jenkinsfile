pipeline{
    agent any
    tools {
      git 'git'
      jdk 'jdk11'
      maven 'maven'
    }
    environment {
      AWS_ACCESS_KEY_ID = credentials('accessKey')
      AWS_SECRET_KEYS = credentials('secretKey') 
      AWS_DEFAULT_REGION = "us-east-2"
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
            
            sh '''terraform init 
                  terraform plan
               '''
                } 
        }
      
      
    }

post {
        always {
            archiveArtifacts artifacts: '**/target/*.war', onlyIfSuccessful: true
            
        }
    }
  
}
