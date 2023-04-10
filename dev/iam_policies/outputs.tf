output "frontend_cross_account_engineering_arn" {
  value = aws_iam_policy.frontend_cross_account_engineering.arn
}
output "data_cross_account_engineering_arn" {
  value = aws_iam_policy.data_cross_account_engineering.arn
}

output "sre_cross_account_arn" {
  value = aws_iam_policy.sre_cross_account.arn
}

output "backend_cross_account_engineering_arn" {
  value = aws_iam_policy.backend_cross_account_engineering.arn
}

output "backend_cross_account_engineering_readonly-arn" {
  value = aws_iam_policy.backend_cross_account_engineering_readonly.arn
}
