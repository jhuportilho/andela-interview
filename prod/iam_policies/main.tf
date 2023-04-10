terraform {
  backend "s3" {
    bucket  = "rogeria-dev-terraform-backend"
    key     = "interview-andela/iac/iam/terraform_iam_policies.tfstate"
    region  = var.region
  }
}

data "terraform_remote_state" "terraform_remote_state_iam_policies" {
  backend = "s3"
  config = {
    bucket  = "rogeria-dev-terraform-backend"
    key     = "interview-andela/iac/iam/terraform_iam_policies.tfstate"
    region  = var.region
    profile = var.environment
  }
}

provider "aws" {
  region  = var.region
  profile = var.environment
}
