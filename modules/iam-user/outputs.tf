output "this_iam_access_key" {
  value = aws_iam_access_key.this.id
}

output "this_iam_secret_key" {
  value = aws_iam_access_key.this.secret
}