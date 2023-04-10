resource "aws_iam_policy" "backend_cross_account_engineering" {
  name        = "backend_cross_account_engineering"
  path        = "/"
  description = "Terraform managed, gives access to backend engineering to using crossaccount role"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": [
      "arn:aws:iam::qa-account:role/backend_engineering",
      "arn:aws:iam::prod-account:role/backend_engineering"
    ]
  }
}
EOF
}
