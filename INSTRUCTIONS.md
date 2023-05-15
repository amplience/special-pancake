# Prerequisites

A linux shell.
Network access to AWS


Docker
Terraform https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


Environment vars with credentials for AWS account and some other details

```
export AWS_ACCESS_KEY_ID=REDACTED
export AWS_SECRET_ACCESS_KEY=REDACTED
export AWS_REGION=REDACTED

#export AWS_DEFAULT_REGION=REDACTED

export AWS_ACCOUNT=REDACTED
```

# Step 1 - create ECR
```
cd infrastructure/container-registry
./create-container-registry.sh
```

# Step 2 - build and push docker image.
```
./build-docker-image.sh
```

# Step 3 - create ECS stack
```
cd infrastructure/stack
./create-stack.sh
```

# Step 4 - test

./test.sh <svc endpoint here>
