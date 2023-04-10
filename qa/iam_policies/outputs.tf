output "backend_engineering-arn" {
  value = aws_iam_policy.backend_engineering.arn
}

output "cloudtrail_cloudwatchlogs-arn" {
  value = aws_iam_policy.cloudtrail_cloudwatchlogs.arn
}
