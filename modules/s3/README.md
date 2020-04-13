# Provide a S3 bucket

## Initialization

Initialize **Terraform** environement with this command:
```sh
terraform init
```

## Define S3 characteristics
Define `main.tf` file like that:

```
provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "private"
  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}
```

## Define variables
Define `variables.tf` file like that:

```
variable "region" {
  default = "eu-west-1"
}
variable "access_key" {
  default = "your access key..."
}
variable "secret_key" {
  default = "your secret key..."
}
variable "bucket_name" {
  default = "aws-glue-pokemon-csv"
}
```

## Plan
Plan to verify differents steps:
```sh
terraform plan -out "s3.tfplan"
```

Result:
```
Terraform will perform the following actions:

  # aws_s3_bucket.b will be created
  + resource "aws_s3_bucket" "b" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = "aws-glue-pokemon-csv"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "Dev"
          + "Name"        = "aws-glue-pokemon-csv"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

## Apply
Create related resources:
```sh
terraform apply "s3.tfplan"
```

Result:
```
aws_s3_bucket.b: Creating...
aws_s3_bucket.b: Creation complete after 3s [id=aws-glue-pokemon-csv]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
```