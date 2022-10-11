pipeline{
    agent any
    tools {
      git 'git'
      jdk 'jdk11'
      maven 'maven'
    }
    environment {
      AWS_ACCESS_KEY_ID = credentials('Secret Access Key')
      AWS_SECRET_KEYS = awscredientialskeys('Access Key ID')
      AWS_DEFAULT_REGION = "us-est-2"
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
            
                sh '''terraform init -input=false
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
