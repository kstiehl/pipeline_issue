@Library(['piper-lib-os']) _

pipeline {
    agent any

    triggers {
        githubPush()
        pollSCM('')
    }

   options {
        skipDefaultCheckout(true)
    }

    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                checkout scm
            }
        }

    stage('Build') {
        steps {
    		kanikoExecute(
        		script: this,
       		 buildOptions: ["--no-push" ],
        dockerfilePath: "Dockerfile",
        containerImageNameAndTag: "test:0.0",
        verbose: true
    )
    echo "end of build"
        }
       }
   }
}
