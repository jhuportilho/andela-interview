resource "aws_iam_policy" "data_cross_account_engineering" {
  name        = "data_cross_account_engineering"
  path        = "/"
  description = "Terraform managed, gives access to readshifit readonly to using crossaccount role"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": [
      "arn:aws:iam::qa-account:role/data_engineering",
      "arn:aws:iam::prod-account:role/data_engineering"
    ]
  }
}
EOF
}
