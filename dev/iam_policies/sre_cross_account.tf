resource "aws_iam_policy" "sre_cross_account" {
  name        = "sre_cross_account"
  path        = "/"
  description = "Terraform managed, gives access to admins to using crossaccount role"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": [
      "arn:aws:iam::*:role/sre",
      "arn:aws:iam::*:role/securityaudit"
    ]
  }
}
EOF
}
