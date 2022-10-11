pipeline{
    agent any
    tools {
      git 'git'
      jdk 'jdk11'
      maven 'maven'
    }
  environment {
        AWS_ACCESS_KEY_ID     = credentials('awsaccesskey')
        AWS_SECRET_ACCESS_KEY = credentials('awssecretkey')
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
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "awscredentials",accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                sh '''terraform init
                      terraform plan
                   '''
                } 
        }
      
      }
    }

post {
        always {
            archiveArtifacts artifacts: '**/target/*.war', onlyIfSuccessful: true
            
        }
    }
  
}
