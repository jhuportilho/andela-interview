terraform {
  backend "s3" {
    bucket  = "rogeria-prod-terraform-backend"
    key     = "interview-andela/iac/iam/terraform_iam_users.tfstate"
    region  = var.region
    profile = var.environment
  }
}

provider "aws" {
  region  = var.region
  profile = var.environment
}
