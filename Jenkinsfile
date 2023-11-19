pipeline{
    agent{
        label "java-17"
    }
    tools{
        jdk 'jdk-17'
        mvn 'mvn'
    }
    stages{
        stage("Game-of-life"){
            steps{
                git url: "https://github.com/spring-projects/spring-petclinic.git",
                    branch: 'main'
            }
        }
        stage("Build"){
            steps{
                sh "mvn package"
            }    
        } 
    }
}