resource "aws_iam_group" "lpdd-ops-iam-group" {
  name = "ops"
}

resource "aws_iam_user" "lpdd-ops-iam-user" {
  name = "lpdd-ops"

  provisioner "local-exec" {
    command = "aws iam create-access-key --user-name ${aws_iam_user.lpdd-ops-iam-user.id} > ${var.keys-dir}/lpddops-access-key"
  }

  tags = {
    Name = "lpdd ops iam user"
  }
}

resource "aws_iam_user_group_membership" "lpdd-ops-iam-membership" {
  user = aws_iam_user.lpdd-ops-iam-user.name

  groups = [
    aws_iam_group.lpdd-ops-iam-group.name,
  ]
}

resource "aws_iam_policy" "lpdd-ops-bucket-policy" {
  name        = "lpdd-ops-bucket-policy"
  description = "lpdd ops policy to populate data in aws s3 bucket"
  policy      = "${file("policys3bucket.json")}"
}

resource "aws_iam_user_policy_attachment" "lpdd-ops-bucket-policy-attach" {
  user       = aws_iam_user.lpdd-ops-iam-user.name
  policy_arn = aws_iam_policy.lpdd-ops-bucket-policy.arn
}
