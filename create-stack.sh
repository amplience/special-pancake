#!/bin/bash
set -euo pipefail
#set -x

cd infrastructure/stack
terraform apply
