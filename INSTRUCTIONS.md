# Prerequisites

A linux shell.
Network access to AWS


The following software

## Docker

Tested with 23.0.1-rd (rancher desktop on MacOS Ventura)

https://rancherdesktop.io/

## Terraform

Tested with V1.4.0

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


## AWS CLI

To support fetching ECR login.

Tested with aws-cli/1.27.132 Python/3.11.3 Darwin/22.4.0 botocore/1.29.132

https://pypi.org/project/awscli/



## Environment vars exported in shell

Credentials for AWS account, region, and AWS_ACCOUNT number.

AWS account must have sufficient permissions. Tested with AdministratorAccess.


```
export AWS_ACCESS_KEY_ID=REDACTED
export AWS_SECRET_ACCESS_KEY=REDACTED
export AWS_REGION=REDACTED

export AWS_ACCOUNT=REDACTED
```

# Step 0 - Init terraform
```
cd infrastructure/container-registry
terraform init
cd ../stack
terraform init
```

# Step 1 - create ECR
```
./create-container-registry.sh
```

# Step 2 - build and push docker image.
```
./build-docker-image.sh
```

# Step 3 - create ECS stack
```
./create-stack.sh
```

# Step 4 - test

Get the service endpoint from the terraform output of create ECS stack

```
./test.sh <svc endpoint here>
```
