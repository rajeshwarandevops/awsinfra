pipeline {

agent any

stages {

stage(‘Checkout’) {

steps {

checkout([$class: ‘GitSCM’, branches: [[name: ‘*/main’]], extensions: [], userRemoteConfigs: [[url: ‘https://github.com/rajeshwarandevops/awsinfra.git‘]]])

}