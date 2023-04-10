resource "aws_iam_policy" "cloudtrail_cloudwatchlogs_policy" {
  name        = "cloudtrail_cloudwatchlogs_policy"
  path        = "/"
  description = "Terraform managed, allow cloudtrail to push logs to cloudwatch logs"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogStream",
            "Resource": "arn:aws:logs:*:qa-account:log-group:cloudtrail/audit-logs:log-stream:qa-account_cloudtrail_*"
        },
        {
            "Effect": "Allow",
            "Action": "logs:PutLogEvents",
            "Resource": "arn:aws:logs:*:qa-account:log-group:cloudtrail/audit-logs:log-stream:qa-account_cloudtrail_*"
        }
    ]
}
EOF
}
