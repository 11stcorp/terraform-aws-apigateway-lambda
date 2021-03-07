
output "region" {
  description = "AWS region."
  value       = var.region
}

# output "lambda_size" {
#   description = "Size in bytes of the func .zip file"
#   value = aws_lambda_function.pm.source_code_size
# }

output "base_url" {
  value = aws_api_gateway_deployment.pm.invoke_url
}
