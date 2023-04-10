resource "aws_iam_user" "iam_user" {
  for_each = toset(var.users)
  name     = each.key
}

resource "aws_iam_user_login_profile" "iam_loging_profile" {
  for_each                = toset(var.users)
  user                    = each.key
  password_reset_required = true
  password_length         = 15
  pgp_key                 = file("${path.module}/key.gpg")
  depends_on              = [aws_iam_user.iam_user]
  lifecycle {
    ignore_changes = [password_length, password_reset_required, pgp_key]
  }
}
