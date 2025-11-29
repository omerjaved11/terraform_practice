resource "aws_iam_group" "module_group" {
  name = var.group_name
}

resource "aws_iam_user" "module_user" {
  name = var.user_name
}

resource "aws_iam_user_group_membership" "user_to_group" {
  user       = aws_iam_user.module_user.name
  groups     = [aws_iam_group.module_group.name]
  depends_on = [aws_iam_user.module_user, aws_iam_group.module_group]
}