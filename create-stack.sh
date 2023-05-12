#!/bin/bash
set -euo pipefail
#set -x

cd infrastructure/stack
terraform validate
terraform plan
terraform apply
