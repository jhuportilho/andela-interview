module "sre" {
  source           = "../../modules/iam_role"
  role_name        = "sre"
  role_description = "Cross Account role for admins"
  policies = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
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
          "arn:aws:iam::dev-account:user/rogeria_sre_1",
          "arn:aws:iam::dev-account:user/user_sre_2",
          "arn:aws:iam::dev-account:user/user_sre_3"
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

output "sre-role-arn" {
  value = module.sre.role-arn
}