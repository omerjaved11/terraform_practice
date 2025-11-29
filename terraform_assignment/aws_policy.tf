resource "aws_iam_policy" "as_policy" {
  name        = "assignment_policy_ec2_s3"
  description = "assignment test policy"

  policy = jsonencode(
    {
      "Version" = "2012-10-17"
      Statement = [
        {
          Action = [
            "ec2:*",
            "s3:List*"
          ]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
  })
}

resource "aws_iam_user_policy_attachment" "as_policy_attach" {
  user       = aws_iam_user.as_user.name
  policy_arn = aws_iam_policy.as_policy.arn
  depends_on = [aws_iam_policy.as_policy]
}