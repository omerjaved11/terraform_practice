resource "aws_iam_group" "as_group" {
  name = "tfgroup"
}

resource "aws_iam_user" "as_user" {
  name = "tfadmin"
}

resource "aws_iam_user_group_membership" "user_to_group" {
  user       = aws_iam_user.as_user.name
  groups     = [aws_iam_group.as_group.name]
  depends_on = [aws_iam_user.as_user, aws_iam_group.as_group]
}