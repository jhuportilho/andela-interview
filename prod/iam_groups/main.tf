terraform {
  required_version = ">=1.4.4"
  backend "s3" {
    bucket = "rogeria-prod-terraform-backend"
    key    = "interview-andela/iac/iam/terraform_iam_groups.tfstate"
    region = var.region
  }
}

data "terraform_remote_state" "terraform_remote_state_iam_groups" {
  backend = "s3"
  config = {
    bucket  = "rogeria-prod-terraform-backend"
    key     = "interview-andela/iac/iam/terraform_iam_groups.tfstate"
    region  = var.region
    profile = "prod"
  }
}

provider "aws" {
  region  = var.region
  profile = var.environment
}
