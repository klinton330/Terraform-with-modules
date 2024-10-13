pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        GC_ACCESS_KEY_ID     = credentials('DEV_ACCESS_KEY')
        GC_SECRET_ACCESS_KEY = credentials('DEV_ACCESS_SECRET')
        GC_REGION= "ap-northeast-1"
    }
    agent  any
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/klinton330/Terraform-with-modules.git"
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                sh 'pwd;cd terraform/ ; terraform init'
                sh "pwd;cd terraform/ ; terraform plan -var-file="envs/dev/terraform.tfvars" -out tfplan"
                sh 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
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
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "pwd;cd terraform/ ; terraform apply -var-file="envs/dev/terraform.tfvars" -input=false tfplan"
            }
        }
    }

  }