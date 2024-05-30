# LocalStack hosting
LocalStack provides a convenient environment for developing and testing AWS applications locally, minimizing development time and enhancing product velocity. By simulating AWS services locally, it helps reduce unnecessary AWS expenses and eliminates the complexity and risk associated with managing AWS development accounts.
Explore more at https://www.localstack.cloud/

## I. ⚙ Prerequisites
- Install Python
- Install Docker

## II. ⚙ Installing

### 1. LocalStack
> See https://app.localstack.cloud/getting-started

Get started with LocalStack by following the steps below:
- Create LocalStack account (use Github SSO)
- Register for the free **Hobby Subscription** (ideal for non-enterprise work)
- Install the **LocalStack CLI**
```sh
sudo tar xvzf ~/Downloads/localstack-cli-3.0.2-linux-*-onefile.tar.gz -C /usr/local/bin
```
- If you prefer, you can install it using **pip**:
```sh
python3 -m pip install --upgrade localstack
```
### 2. AWS CLI
Set up the AWS Command Line Interface (CLI) for LocalStack:
- Install AWS CLI v2
- Configure "dummy" credentials:
```sh
$ aws configure
AWS Access Key ID [None]: dummy
AWS Secret Access Key [None]: dummy
Default region name [None]: eu-west-1
Default output format [None]:
```
- Install AWS CLI wrapper for LocalStack:
```sh
python -m pip install awscli-local
```
### 3. Terraform
> See https://docs.localstack.cloud/user-guide/integrations/terraform/

Integrate Terraform with LocalStack:
- Install Terraform
- Install `tflocal` wrapper for LocalStack
```sh
python -m pip install terraform-local
```

## III. 📝 Initilization
Prepare your environment for LocalStack:
- Create a Docker network to facilitate communication between AWS CLI v2 and LocalStack:
```sh
docker network create localstack
```
- Set your personal token as an environment variable (required for LocalStack event with a free account):
```sh
export LOCALSTACK_AUTH_TOKEN=<your token>
```
- Launch LocalStack
```sh
localstack start
```
- Define environment variables for terraform wrapper
```sh
export AWS_DEFAULT_REGION=eu-west-1
export AWS_ENDPOINT_URL=http://localhost:4566
```

### IV. 🪂 Deploying
- Navigate to the directory containing your Terraform files.
- Deploy your infrastructure in LocalStack using the Terraform wrapper with the following commands:
```sh
tflocal init
tflocal plan
tflocal apply --auto-approve
```
- Visualize the created resources on LocalStack by visiting: https://app.localstack.cloud/inst/default/status


## V. 🛠 Patterns
- [ ] [API Gateway Dynamodb](https://github.com/veben/aws_tf_apigateway_dynamodb/blob/main/readme.md)