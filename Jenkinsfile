pipeline {
        
    agent any
        
    stages{
              
        stage("Git Checkout"){

            steps{

                script{

                    git branch: 'main', url: 'https://github.com/JeffrinMathew/CI_CD-Pipeline-Project.git'

                }
                    
            }
        }
        stage("UNIT Testing"){

            steps{

                script{

                        sh 'mvn test'

                }
            }
        }
        stage("Integration Testing"){

            steps{

                script{

                        sh 'mvn verify -DskiUnitTests'

                }
            }
        }
        stage("Maven build"){

            steps{

                script{

                        sh 'mvn clean install'

                }
            }
        }
        stage("Static Code Analysis"){

            steps{

                script{

                    
                        withSonarQubeEnv(credentialsId: 'sonarqube-api-key',installationName: 'sq1') {

                            sh 'mvn clean package sonar:sonar'

                    }
                   
                }
            }
        }

    }
}

