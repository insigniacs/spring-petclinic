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
                sh "docker image build -t spc ."
                sh "docker image tag spc shaiknadeem/spc:$BUILD_ID"
                sh "docker image push shaiknadeem/spc:$BUILD_ID"
                sh "docker container run -d -P shaiknadeem/spc:$BUILD_ID"
            }   
        } 
    }
}