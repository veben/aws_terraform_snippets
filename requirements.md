# Requirements

*Last updated: 2020/04/09*

## Create free tier account

[https://portal.aws.amazon.com/gp/aws/developer/registration/index.html?nc2=h_ct&src=header_signup](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html?nc2=h_ct&src=header_signup)

## Enable Multi-factor authentication (MFA)

1. Connect to [AWS console](https://aws.amazon.com/fr/console/)
2. Follow the official guide : [https://console.aws.amazon.com/iam/home?#/security_credentials](https://console.aws.amazon.com/iam/home?#/security_credentials)

## Create Developer user with programatic access

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
10. Put them in `C:\Users\<User>\.aws/credentials` file, like that:

	```
	[p-dev]
	aws_access_key_id = dev_ACCESS_KEY
	aws_secret_access_key = dev_ACCESS_KEY
	region = eu-west-1
	```

## Install **terraform**:

### On Windows directly  

1. Download: [https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_windows_amd64.zip](https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_windows_amd64.zip)
2. Unzip it to `C:\Env\tools\Terraform`
3. Add new env var to **Path** with value `C:\Env\tools\Terraform` 
4. Known version:
	```sh
	terraform –version
	```

5. Create env:
	```sh
	terraform workspace new dev
	```

### Within Linux on Windows : 

1. Autorize Linux on Windows with **Powershell admin mode**:

	```sh
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
	```	
2. Reboot

3. Install Debian from Windows store

4. Update `apt-get` + install `unzip` & `wget`

	```sh
	sudo apt-get update 
	sudo apt-get install unzip wget 
	```	
5. Install **Terraform**

	```sh
	sudo unzip /tmp/terraform_0.12.24_linux_amd64.zip -d /usr/local/bin/
	sudo wget -P /tmp https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip 
	```	
6. Create alias adding following line to `~/.bashrc` file: `alias tft='/usr/local/bin/terraform'`

### Intellij part

1. Install Terraform plugin for Intellij 

2. Update Terraform path to: `\\wsl$\Debian\usr\local\bin\terraform`

## Create Administrator user with programatic access (optional, if you need to deat with IAM or other things)

1. Connect to [AWS console](https://aws.amazon.com/fr/console/)
2. Go to **IAM** service
3. Create **Group** named `Administrators`
4. Add existing **Policy** `AdministratorAccess` to the group
5. Create **User** named `admin`
6. Check **Programmatic access**
7. Check **AWS Management Console access** (optional)
8. Add it to the administrator group 
9. Copy **Access keys** (access key ID and secret access key)
10. Put them in `C:\Users\<User>\.aws/credentials` file, like that:

	```
	[p-admin]
	aws_access_key_id = admin_ACCESS_KEY
	aws_secret_access_key = admin_ACCESS_KEY
	region = eu-west-1
	```