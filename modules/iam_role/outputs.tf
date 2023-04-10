output "role-arn" {
  value = aws_iam_role.iam_role.arn
}
output "role-name" {
  value = aws_iam_role.iam_role.name
}
output "instance-profile-arn" {
  value = aws_iam_instance_profile.iam_instance_profile.arn
}
output "instance-profile-name" {
  value = aws_iam_instance_profile.iam_instance_profile.name
}
