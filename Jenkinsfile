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
                sh 'go version'
                cleanWs()
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "end of build"
            }
        }
    }
}
