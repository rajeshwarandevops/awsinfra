def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]


pipeline {
      
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
   agent  any

   tools {
terraform 'terraform'
}

    stages {
        stage('Git checkout') {
            steps {
                echo 'Cloning project codebase...'
                git branch: 'main', url: 'https://github.com/rajeshwarandevops/awsinfra.git'
                sh 'ls'
            }
        }
        
         stage('Verify Terraform Version') {
            steps {
                echo 'verifying the terrform version...'
                sh 'terraform --version'
               
            }
        }
        
        stage('Terraform init') {
            steps {
                echo 'Initiliazing terraform project...'
                sh 'terraform init'
               
            }
        }
        
        
        stage('Terraform validate') {
            steps {
                echo 'Code syntax checking...'
                sh 'terraform validate'
               
            }
        }
        
        
        stage('Terraform plan') {
            steps {
                echo 'Terraform plan for the dry run...'
                sh 'terraform plan'
               
            }
        }
        
        
        
        
        stage('Checkov scan') {
            steps {
                
                sh """
                ls -lah
                cd var/jenkins_home/workspace/aws-terraform-IAC
                #checkov -d . --skip-check
                #checkov -d . --skip-check CKV_AWS_23,CKV_AWS_24,CKV_AWS_126,CKV_AWS_135,CKV_AWS_8,CKV_AWS_23,CKV_AWS_24
                #checkov -d . --skip-check CKV_AWS*
                """
               
            }
        }
        
        
        
        stage('Manual approval') {
            steps {
                
                input 'Approval required for deployment'
               
            }
        }
        
        
         stage('Terraform apply') {
            steps {
                echo 'Terraform apply...'
                sh 'terraform apply --auto-approve'
               
               
            }
        }
        
        
    }
    
     post { 
        always { 
            echo 'Terraform Automation & AWS Infra!'
            slackSend channel: '#aws-terraform-iac-jenkins', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
    
    
    
}
a
