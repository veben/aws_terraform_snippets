# LocalStack hosting
> LocalStack allows to develop and test your AWS applications locally to reduce development time and increase product velocity. Reduce unnecessary AWS spend and remove the complexity and risk of maintaining AWS dev accounts.
> See https://www.localstack.cloud/

## I. ⚙ Installing

### 1. Python

### 2. Docker

### 3. LocalStack
> See https://app.localstack.cloud/getting-started

- Create LocalStack account (use Github SSO)
- Register to free subscription **Hobby Subscription** (available for non enterprise work)
- Install **LocalStack CLI**
```sh
sudo tar xvzf ~/Downloads/localstack-cli-3.0.2-linux-*-onefile.tar.gz -C /usr/local/bin
```
- Install LocalStack
```sh
python -m pip install localstack
```
### 4. AWS CLI
- Install AWS CLI v2
- Configure "dummy" credentials
```sh
$ aws configure
AWS Access Key ID [None]: dummy
AWS Secret Access Key [None]: dummy
Default region name [None]: eu-west-1
Default output format [None]:
```
- Install AWS CLI wrapper for LocalStack
```sh
python -m pip install awscli-local
```
### 5. Terraform
> See https://docs.localstack.cloud/user-guide/integrations/terraform/
- Install Terraform
- Install `tflocal` wrapper for LocalStack
```sh
python -m pip install terraform-local
```

## II. 📝 Initilization
- Create docker network to make AWS CLI v2 and Localstack communicate
```sh
docker network create localstack
```
- Add your personal token as environment variable (needed by LocalStack event with free acount)
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

### III. 🪂 Deploying
- Deploy the infrastructure using terraform wrapper
```sh
tflocal init; tflocal plan; tflocal apply --auto-approve
```
- Visualize the created resources on LocalStack: https://app.localstack.cloud/inst/default/status


## IV. 🛠 Patterns
- [ ] [API Gateway Dynamodb](https://github.com/veben/ls_tf_apigateway_dynamodb/blob/main/readme.md)