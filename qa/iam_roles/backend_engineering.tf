module "backend_engineering" {
  source           = "../../modules/iam_role"
  role_name        = "backend_engineering"
  role_description = "Cross Account role for developer backend"
  policies = [
    data.terraform_remote_state.terraform_remote_state_iam_roles.outputs.backend_engineering-arn
  ]
  max_session_duration = "43200"
  assume_role_policy   = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::dev-account:user/developer_backend_1",
          "arn:aws:iam::dev-account:user/developer_backend_2",
          "arn:aws:iam::dev-account:user/developer_backend_3"
        ]
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "Bool": {
          "aws:MultiFactorAuthPresent": "true"
        }
      }
    }
  ]
}
EOF
}

output "backend_engineering-arn" {
  value = module.backend_engineering.role-arn
}