pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
   agent  any

   tools {
terraform 'terraform'
}



    stages {
        stage('checkout-SCM') {
            steps {
                 git url: 'https://github.com/rajeshwarandevops/awsinfra.git', branch: 'main',
                 
                    
                }
            }

        stage('Plan') {
            steps {
                sh 'pwd; terraform init'
                sh "pwd; terraform plan -out tfplan"
                sh 'pwd; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply Iac') {
            steps {
                sh "pwd; terraform apply -input=false tfplan"
            }
        }
    }

  post{
        always{
            slackSend channel: '#aws-terraform-iac-jenkins', message: 'Message: "Please find the status of the Pipeline Status -$[currentBuild.currentResult]  ${env.JOB_NAME} ${env.BUILD_NUMBER} ${env.BUILD_URL} ${env.BUILD_ID}"
        } 
  

 }

 }