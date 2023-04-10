module "securityaudit" {
  source           = "../../modules/iam_role"
  role_name        = "securityaudit"
  role_description = "Role for security audit"
  policies = [
    "arn:aws:iam::aws:policy/securityaudit"
  ]
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "rogeria_sre_1",
          "user_sre_2",
          "user_sre_3"
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

output "securityaudits-role-arn" {
  value = module.securityaudit.role-arn
}
