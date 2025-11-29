resource "aws_iam_policy" "module_policy" {
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

resource "aws_iam_user_policy_attachment" "module_policy_attach" {
  user       = var.user_module_name
  policy_arn = aws_iam_policy.module_policy.arn
  depends_on = [aws_iam_policy.module_policy]
}