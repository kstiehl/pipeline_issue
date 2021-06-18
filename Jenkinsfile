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

//         stage('Build-Single-Stage') {
//             steps {
//                 kanikoExecute(
//       	            script: this,
//                     buildOptions: ["--no-push" ],
//                     dockerfilePath: "single-stage.Dockerfile",
//                     containerImageNameAndTag: "test:0.0",
//                     verbose: true
//                  )
//                  echo "end of build"
//             }
//         }

        stage('Build-Multi-Stage') {
            steps {
                kanikoExecute(
                    script: this,
                    buildOptions: ["--no-push" ],
                    dockerfilePath: "multi-stage.Dockerfile",
                    containerImageNameAndTag: "test:0.0",
                    dockerImage: "gcr.io/kaniko-project/executor:v1.3.0-debug",
                    verbose: true
                 )
                script {
                    echo "end of build"
                    writePipelineEnv(script: this, verbose: true)
                    sh "ls -al ./.pipeline/commonPipelineEnvironment/*"
                    sh "ls -al ./.pipeline/commonPipelineEnvironment/**/*"
                    sh "chmod -R 777 ./.pipeline"
                    sh "ls -al ./.pipeline/commonPipelineEnvironment/*"
                    sh "ls -al ./.pipeline/commonPipelineEnvironment/**/*"
                    stash name: "testStash", includes: "./pipeline/**/*"
                    sh "rm -rf ./.pipeline/"
                    unstash name: "testStash"
                }
            }
        }


    }
}
