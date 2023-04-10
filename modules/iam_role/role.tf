resource "aws_iam_role" "iam_role" {
  name               = var.role_name
  path               = var.path
  description        = "Terraform managed ${var.role_description}"
  assume_role_policy = var.assume_role_policy
  tags = {
    Terraform = "true",
    Name      = var.role_name
  }
  max_session_duration = var.max_session_duration
}

resource "aws_iam_role_policy_attachment" "attachments" {
  for_each   = toset(var.policies)
  role       = aws_iam_role.iam_role.name
  policy_arn = each.value
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = var.role_name
  role = aws_iam_role.iam_role.name
}
