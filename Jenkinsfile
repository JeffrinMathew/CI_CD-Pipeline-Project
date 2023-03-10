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
        stage("Quality Gate Status"){
            
            steps{

                 script{

                    waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube-api-key'
                 }
            }
        }
        stage("Upload jar File to Nexus"){

            steps{

                script{

                   nexusArtifactUploader artifacts: [[artifactId: 'springboot', classifier: '', file: 'target/Uber.jar', type: 'jar']], credentialsId: 'nexus-auth', groupId: 'com.example', nexusUrl: 'localhost:9191', nexusVersion: 'nexus3', protocol: 'http', repository: 'http://localhost:9191/repository/Application_1_Release/', version: '1.0.0'
                }
            }
        }

    }
}

