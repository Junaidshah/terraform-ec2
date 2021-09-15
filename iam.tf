resource "aws_iam_role_policy" "nginx_policy" {
  name = "nginx_policy"
  role = aws_iam_role.nginx_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:RunInstances",
          "ec2:AssociateIamInstanceProfile",
          "ec2:ReplaceIamInstanceProfileAssociation"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "nginx_role" {
  name = "nginx_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "nginx_profile" {
  name = "nginx_profile"
  role = aws_iam_role.nginx_role.name
}