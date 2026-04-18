pipeline {
    agent any

    parameters {
        choice(
            name: 'TF_ACTION',
            choices: ['plan', 'apply'],
            description: 'Choose Terraform action'
        )
        string(
            name: 'GIT_BRANCH',
            defaultValue: 'main',
            description: 'Git branch to build'
        )
    }

    environment {
        TF_IN_AUTOMATION   = 'true'
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${params.GIT_BRANCH}",
                    url: 'https://github.com/Raveena92/terraform-jenkins-integration.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        // PLAN stage with condition
        stage('Terraform Plan') {
            when {
                expression { params.TF_ACTION == 'plan' || params.TF_ACTION == 'apply' }
            }
            steps {
                sh 'terraform plan -input=false'
            }
        }

        stage('Approval') {
            when {
                expression { params.TF_ACTION == 'apply' }
            }
            steps {
                input message: 'Do you want to apply this Terraform plan?'
            }
        }

        // APPLY stage
        stage('Terraform Apply') {
            when {
                expression { params.TF_ACTION == 'apply' }
            }
            steps {
                sh 'terraform apply -input=false -auto-approve'
            }
        }
    }

    post {
        success {
            echo 'Terraform pipeline completed successfully'
        }
        failure {
            echo 'Terraform pipeline failed'
        }
    }
}
