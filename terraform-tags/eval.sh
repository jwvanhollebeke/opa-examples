#!/bin/bash

opa eval \
    --data policy \
    --input "${1}" "data.terraform.deny[_]" \
    --format=pretty \
    --fail-defined \
|| exit $?
