variable "region" {
  description = "생성될 리전을 입력 합니다. e.g: ap-northeast-2"
  default     = "ap-northeast-2"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "lambda_zip_filename" {
  description = "A temp zip file name that template/lambda_code files"
  default     = "lambda_function"
}

variable "listener_arns" {
  description = "lambda source code param that listener_arns"
  default     = ""
}

variable "target_group_arn_pm" {
  description = "lambda source code param that target_group_arn_pm"
  default     = ""
}

variable "target_group_arn_service" {
  description = "lambda source code param that target_group_arn_service"
  default     = ""
}

