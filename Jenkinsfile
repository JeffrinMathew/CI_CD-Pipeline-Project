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





}