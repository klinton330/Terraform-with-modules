pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        GC_ACCESS_KEY_ID ="bec9621c-5bc7-400b-87a5-59c6e8bb2eac"
        GC_SECRET_ACCESS_KEY ="Dp8Q_DS0meoixjBob5doqo54vWaML0ZTL6yhl0wKSn4"
        GC_REGION= "ap-northeast-1"
    }
    agent  any
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git branch: 'main', url: 'https://github.com/klinton330/Terraform-with-modules.git'
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                bat 'pwd;cd terraform/ ; terraform init'
                bat "pwd;cd terraform/ ; terraform plan -var-file=envs/dev/terraform.tfvars -out tfplan"
                bat 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
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
                bat "pwd;cd terraform/ ; terraform apply -var-file=envs/dev/terraform.tfvars -input=false tfplan"
            }
        }
    }

  }