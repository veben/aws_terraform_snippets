# Provide a S3 bucket

> Last updated: 2020/09/21

## Initialization

Initialize **Terraform** environment with this command:
```sh
terraform init
```

## Plan
Plan to verify different steps:
```sh
terraform plan -out "s3.tfplan"
```

Result:
```
Terraform will perform the following actions:

  # aws_s3_bucket.bucket_test will be created
  + resource "aws_s3_bucket" "bucket_test" {
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
aws_s3_bucket.bucket_test": Creating...
aws_s3_bucket.bucket_test": Creation complete after 3s [id=aws-glue-pokemon-csv]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
```

## Destroy
Delete related resources:
```sh
terraform destroy "s3.tfplan"
```