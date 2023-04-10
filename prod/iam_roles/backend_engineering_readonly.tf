module "backend_engineering_readonly" {
  source           = "../../modules/iam_role"
  role_name        = "readonly"
  role_description = "Cross Account role for readonly"
  policies = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
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

output "backend_engineering_readonly_arn" {
  value = module.backend_engineering_readonly.role-arn
}