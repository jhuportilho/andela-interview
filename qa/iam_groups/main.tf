terraform {
  required_version = ">=1.4.4"
  backend "s3" {
    bucket = "rogeria-qa-terraform-backend"
    key    = "interview-andela/iac/iam/terraform_iam_groups.tfstate"
    region = var.region
  }
}

data "terraform_remote_state" "terraform_remote_state_iam_policies" {
  backend = "s3"
  config = {
    bucket  = "rogeria-qa-terraform-backend"
    key     = "interview-andela/iac/iam/terraform_iam_groups.tfstate"
    region  = var.region
    profile = "qa"
  }
}

provider "aws" {
  region  = var.region
  profile = var.environment
}
