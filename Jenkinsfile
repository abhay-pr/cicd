pipeline {

    agent any
    
    environment {
        PASS = credentials('registry-pass') 
    }

    stages {

        stage('Build') {
            steps {
                sh '''
                    ./maven_build.sh mvn -B -DskipTests clean package
                    ./build.sh
                    
                '''
            }

            // post {
            //     success {
            //        archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
            //     }
            // }
        }

        stage('Test') {
            steps {
                sh './maven_build.sh mvn test'
            }

            // post {
            //     always {
            //         junit 'java-app/target/surefire-reports/*.xml'
            //     }
            // }
        }

        stage('Push') {
            steps {
                sh './push/push.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}