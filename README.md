# Open Policy Agent Examples

## Examples

| Name           | Description                                                              |  
|:---------------|:-------------------------------------------------------------------------|
| terraform-tags | Enforce that terraform resources have a particular set of resource tags. |


## Evaluating policy

1. Run `terraform plan -out tfplan.binary`
2. Convert the output file to JSON. Run `terraform show -json tfplan.binary > tfplan.json`
3. Evaluate the JSON using OPA policy. Run:

   ```sh
   opa eval \
       --data policy \
       --input "${1}" "data.terraform.deny[_]" \
       --format=pretty \
       --fail-defined
   ```
