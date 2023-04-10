terraform {
  backend "s3" {
    bucket  = "rogeria-dev-terraform-backend"
    key     = "interview-andela/iac/iam/terraform_iam_users.tfstate"
    region  = var.region
    profile = "dev"
  }
}

provider "aws" {
  region  = var.region
}
