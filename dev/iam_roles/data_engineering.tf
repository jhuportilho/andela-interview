module "data_engineering" {
  source           = "../../modules/iam_role"
  role_name        = "data_engineering"
  role_description = "data_engineering role"
  policies = [
    "arn:aws:iam::aws:policy/AmazonRedshiftReadOnlyAccess"
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
          "arn:aws:iam::dev-account:user/data_engineer_1",
          "arn:aws:iam::dev-account:user/data_engineer_2",
          "arn:aws:iam::dev-account:user/data_engineer_3"
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
