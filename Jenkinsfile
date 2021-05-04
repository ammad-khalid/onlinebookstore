pipeline {
    agent {
        label "master"
    }
    tools {
        maven "Maven"
    }
    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "20.74.182.192:8081"
        NEXUS_REPOSITORY = "cp4i-project"
        NEXUS_CREDENTIAL_ID = "nexus-jenkins-user-credentials"
        API_KEY = credentials('apikey')
        USER_CREDENTIALS = credentials('USER_PASSWORD')
        
   /*Nexus credentials and apikey has been stored in global credentials of jenkins*/
    }
    stages {
        stage("Maven Build") {
            steps {
                script {
                    sh "mvn clean install"
                    sh "ls -lh"
                    /*sh "mvn package -DskipTests=true"*/
                }
            }
        }
        stage("Publish to Nexus"){
            steps{
                script{
        nexusArtifactUploader(
                            nexusVersion: NEXUS_VERSION,
                            protocol: NEXUS_PROTOCOL,
                            nexusUrl: NEXUS_URL,
                            /*groupId: 'onlineGID',*/
                            version: 'v1',
                            repository: NEXUS_REPOSITORY,
                            credentialsId: NEXUS_CREDENTIAL_ID,
                            artifacts: [
                                [artifactId: 'onlinebookstore-${BUILD_ID}',
                                classifier: '',
                                file: '/var/lib/jenkins/.m2/repository/onlinebookstore/onlinebookstore/${BUILD_ID}/onlinebookstore-${BUILD_ID}.war',
                                type: 'war'],
                            ]
                        );
                } 
                }
            }
        stage("Build Image") {
            steps {
                script {
                    sh "cp /var/lib/jenkins/.m2/repository/onlinebookstore/onlinebookstore/${BUILD_ID}/onlinebookstore-${BUILD_ID}.war ${workspace}"
                    sh "docker build --build-arg BUILD_ID=${BUILD_ID} --build-arg username=${USER_CREDENTIALS_USR} --build-arg password=${$USER_CREDENTIALS_PSW} -t uk.icr.io/cp4i/cp4i_repo:cp4i_${BUILD_ID} ."
                
                }
            }
        }
        
        stage("Login Container Registry") {
           steps {
                script {
                    sh "docker login -u iamapikey -p ${API_KEY} uk.icr.io"
                
                }
            }
        }
        stage("Push Image") {
           steps {
                script {
                    sh "docker push uk.icr.io/cp4i/cp4i_repo:cp4i_${BUILD_ID}"
                
                }
            }
        }
    }
}
