pipeline {
        
        agent any
        
        stages{
              
            stage("Git Checkout"){
                steps{
                    git branch: 'main', url: 'https://github.com/JeffrinMathew/CI_CD-Pipeline-Project.git'
                }
            }
                stage("UNIT Testing"){
                steps{
                    sh 'mvn test'
            }
            }
            stage("Integration Testing"){

                steps{
                    sh 'mvn verify -DskiUnitTests'
                }
            }
            stage("Maven build"){
                steps{
                    sh 'mvn clean install'
                }
            }
            stage("Static Code Analysis"){
                steps{
                    scripts{
                         withSonarQubeEnv(credentialsId: 'sonarqube-api-key') {
                     sh 'mvn clean package sonar:sonar'

                    }
                   
                    }
            }
        }

    }
}