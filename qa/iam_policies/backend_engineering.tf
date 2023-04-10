resource "aws_iam_policy" "backend_engineering" {
  name        = "backend_engineering"
  path        = "/"
  description = "Terraform managed, gives access EKS in cloudwatch logs"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowToSeeAllGroupsInConsole",
            "Effect": "Allow",
            "Action": "logs:DescribeLogGroups",
            "Resource": "arn:aws:logs:eu-central-1:qa-account:log-group:*"
        },
        {
            "Sid": "AllowToSeeLogsOnlyInRequiredLogGroups",
            "Effect": "Allow",
            "Action": [
                "logs:DescribeLogStreams",
                "logs:GetLogEvents",
                "logs:FilterLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:eu-central-1:qa-account:log-group:/aws/eks/*"
            ]
        }
    ]
}
EOF
}
