provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.aws_region
}

module "testbucket" {
    source  = "../s3"
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
    bucket_name = source[var.bucket_name]
}