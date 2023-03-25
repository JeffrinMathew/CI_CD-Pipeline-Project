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

                        sh 'mvn verify -DskipUnitTests'

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
                    def readPomVersion = readMavenPom file: 'pom.xml'

                    def nexusRepo = readPomVersion.version.endsWith("SNAPSHOT") ? "Application_1-Snapshot" : "Application_1_Release"

                   nexusArtifactUploader artifacts: 
                   [
                        [ 
                            
                            artifactId: 'springboot', classifier: '',
                            file: 'target/Uber.jar', type: 'jar'

                          ]
                    ], 
                    credentialsId: 'nexus-auth',
                    groupId: 'com.example', 
                    nexusUrl: 'localhost:9191', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: nexusRepo , 
                    version: "${readPomVersion.version}"
                }
            }
        }
        stage('Docker Image Build'){

            steps{

                script{

                    sh 'docker image -build -t $JOB_NAME:v1.$BUILD_ID'
                    sh 'docker image tag $JOB_NAME:v1.$BUILD_ID jeffrinmk/$JOB_NAME:v1.$BUILD_ID'
                    sh 'docker image tag $JOB_NAME:v1.$BUILD_ID jeffrinmk/$JOB_NAME:latest'


                }
            }

        }

    }
}

