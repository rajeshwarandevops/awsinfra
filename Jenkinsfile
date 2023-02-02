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
terraform 'terraform 1.3.0'
}



    stages {
        stage('checkout') {
            steps {
			
                 git url: https://github.com/rajeshwarandevops/awsinfra.git', branch: 'main',
                    }
                }
            }



}