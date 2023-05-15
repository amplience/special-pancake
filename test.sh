#!/bin/bash
set -euo pipefail
#set -x

res=$(wget ${1} -O -)
echo Response body is: $res
