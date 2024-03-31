# Cloud hosting


## I. ⚙ Installing
Install **Terraform**
> https://learn.hashicorp.com/tutorials/terraform/install-cli

1. Add the HashiCorp GPG key
```shell script
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```
2. Add the official HashiCorp Linux repository.
```shell script
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```
3. Update and install
```shell script
sudo apt-get update && sudo apt-get install terraform
```
4. Known you  version:
```shell script
terraform -version
```

## II. 📝 Initialization

### 1. Create free tier account
[https://portal.aws.amazon.com/gp/aws/developer/registration/index.html?nc2=h_ct&src=header_signup](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html?nc2=h_ct&src=header_signup)

### 2. Enable Multi-factor authentication (MFA)
1. Connect to [AWS console](https://aws.amazon.com/fr/console/)
2. Follow the official guide : [https://console.aws.amazon.com/iam/home?#/security_credentials](https://console.aws.amazon.com/iam/home?#/security_credentials)

### 3. Create Developer user with programmatic access
> https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console

1. Connect to [AWS console](https://aws.amazon.com/fr/console/) with root account
2. Go to **IAM** service
3. Create **Group** named `Developers`
4. Add existing **Policy** `PowerUserAccess` to the group
5. Create **User** named `dev`
6. Check **Programmatic access**
7. Check **AWS Management Console access** (optional)
8. Add it to the administrator group 
9. Copy **Access keys** (access key ID and secret access key)
10. Put them in `~/.aws/credentials` file, like that:
```
[p-dev]
aws_access_key_id = dev_ACCESS_KEY
aws_secret_access_key = dev_ACCESS_KEY
region = eu-west-1
```

### 4. (Optional) Create Administrator user with programmatic access (optional, if you need to deal with IAM or other things)
1. Connect to [AWS console](https://aws.amazon.com/fr/console/)
2. Go to **IAM** service
3. Create **Group** named `Administrators`
4. Add existing **Policy** `AdministratorAccess` to the group
5. Create **User** named `admin`
6. Check **Programmatic access**
7. Check **AWS Management Console access** (optional)
8. Add it to the administrator group 
9. Copy **Access keys** (access key ID and secret access key)
10. Put them in `~/.aws/credentials` file, like that:
```
[p-admin]
aws_access_key_id = admin_ACCESS_KEY
aws_secret_access_key = admin_ACCESS_KEY
region = eu-west-1
```

## III. 🪂 Deploying
Deploy the infrastructure using terraform
```sh
terraform init; terraform plan; terraform apply --auto-approve
```
