terraform {
  backend "s3" {
    bucket  = "rogeria-dev-terraform-backend"
    key     = "interview-andela/iac/iam/terraform_iam_roles.tfstate"
    region  = var.region
  }
}

data "terraform_remote_state" "terraform_remote_state_iam_roles" {
  backend = "s3"
  config = {
    bucket  = "rogeria-dev-terraform-backend"
    key     = "interview-andela/iac/iam/terraform_iam_roles.tfstate"
    region  = var.region
    profile = "prod"
  }
}

provider "aws" {
  region  = var.region
  profile = var.environment
}
