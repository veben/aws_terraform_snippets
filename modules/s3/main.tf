provider "aws" {
    region                  = var.region
    shared_credentials_file = var.credentials_file
    profile                 = var.profile
}

resource "aws_s3_bucket" "bucket_test" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}