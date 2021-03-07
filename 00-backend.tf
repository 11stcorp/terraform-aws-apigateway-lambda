terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-11st-k8s-dev-state"
    key            = "apigw-lambda-v1.tfstate"
    dynamodb_table = "terraform-apply-lock"
  }
  required_version = ">= 0.12"
}
