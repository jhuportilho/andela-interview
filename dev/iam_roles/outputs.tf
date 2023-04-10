output "sre_arn" {
  value = aws_iam_role.sre.arn
}

output "backend_engineering_arn" {
  value = aws_iam_role.backend_engineering.arn
}

output "frontend_engineering_arn" {
  value = aws_iam_role.frontend_engineering.arn
}

output "data_engineering_arn" {
  value = aws_iam_role.data_engineering.arn
}