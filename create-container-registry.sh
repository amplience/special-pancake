#!/bin/bash
set -euo pipefail
#set -x

cd infrastructure/container-registry
terraform validate
terraform plan
terraform apply
