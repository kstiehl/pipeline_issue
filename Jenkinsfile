@Library(['piper-lib-os@master']) _

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

        stage('Build-Single-Stage') {
            steps {
                kanikoExecute(
      	            script: this,
                    buildOptions: ["--no-push" ],
                    dockerfilePath: "single-stage.Dockerfile",
                    containerImageNameAndTag: "test:0.0",
                    verbose: true
                 )
                 echo "end of build"
            }
        }

        stage('Build-Multi-Stage') {
            steps {
                kanikoExecute(
                    script: this,
                    buildOptions: ["--no-push" ],
                    dockerfilePath: "multi-stage.Dockerfile",
                    containerImageNameAndTag: "test:0.0",
                    verbose: true
                 )
                 echo "end of build"
            }
        }


    }
}
