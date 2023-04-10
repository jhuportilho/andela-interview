module "frontend_engineering" {
  source           = "../../modules/iam_role"
  role_name        = "frontend_engineering"
  role_description = "frontend_engineering role"
  policies = [
    "arn:aws:iam::aws:policy/CloudFrontReadOnlyAccess"
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
          "arn:aws:iam::dev-account:user/developer_frontend_1",
          "arn:aws:iam::dev-account:user/developer_frontend_2",
          "arn:aws:iam::dev-account:user/developer_frontend_3"
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
