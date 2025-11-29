resource "aws_iam_user" "user1" {
  name = var.user1
}

resource "aws_iam_group" "group1" {
  name = var.group1
}

resource "aws_iam_group_policy_attachment" "group_pol1" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  group      = aws_iam_group.group1.name
}

resource "aws_iam_user_group_membership" "user_group_add1" {
  user   = aws_iam_user.user1.name
  groups = [aws_iam_group.group1.name]
}