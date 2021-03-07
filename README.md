# terraform-aws-apigateway-lambda

## Variables

- sample tfvars : dev.tfvars.sample

| Variable                 | desc                          | default         |
|--------------------------|--------------------------------|-----------------|
| region                   | aws region                     | ap-northeast-2  |
| tags                     | { developer-number  = 1101388} | -               |
| lambda_zip_filename      | filename                       | lambda_function |
| listener_arns            |                                | -               |
| target_group_arn_pm      |                                | -               |
| target_group_arn_service |                                | -               |



## How to run

```bash

terraform init
terraform plan -var-file dev.tfvars
terraform apply -var-file dev.tfvars

```
