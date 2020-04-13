#--------------------------------------------------------------
# This module is used to create an IAM User and his access keys
#--------------------------------------------------------------

resource "aws_iam_user" "this" {
  name = var.name
  path = var.path
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}