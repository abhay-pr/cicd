pipeline {

    agent any
    
    environment {
        PASS = credentials('registry-pass') 
    }

    stages {

        stage('Build') {
            steps {
                sh '''
                    ./maven_build.sh pwd
                    ./maven_build.sh ls -R
                    ./maven_build.sh mvn -B -DskipTests clean package
                    ./build/build.sh
                    
                '''
            }

            post {
                success {
                   archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                }
            }
        }

        stage('Test') {
            steps {
                sh './maven_build.sh mvn test'
            }

            post {
                success {
                    junit 'java-app/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Push') {
            steps {
                sh './push/push.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh './deploy/deploy.sh'
            }
        }
    }
}