output "user_passwords" {
  value = zipmap(values(aws_iam_user.iam_user)[*]["name"], values(aws_iam_user_login_profile.iam_loging_profile)[*]["encrypted_password"])
}
