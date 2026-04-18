terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket       = "my-terraform-state-bucket"
    key          = "jenkins-demo/dev/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


     
