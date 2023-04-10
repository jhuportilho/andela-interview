resource "aws_iam_group" "iam_group" {
  name = var.name
}

resource "aws_iam_group_membership" "group_membership" {
  name       = var.name
  group      = aws_iam_group.iam_group.name
  depends_on = [aws_iam_group.iam_group]
  users      = var.users
}
