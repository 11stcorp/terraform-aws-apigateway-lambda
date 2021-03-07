
data "template_file" "pm_template" {
    template = file("${path.module}/template/lambda_code/pm.py")
}

resource "local_file" "pm_file" {
    content = data.template_file.pm_template.rendered
    filename = "${path.module}/template/lambda_code/pm.py"
  
}

data "archive_file" "pm_zip" {
  type    = "zip"
  output_path = "${path.module}/${local.zipfile}"
  source_dir = "${path.module}/template/lambda_code"
  
  depends_on = [
    local_file.pm_file,
  ]
}

resource "null_resource" "delete_zip" {

    depends_on = [
      aws_lambda_function.pm
    ]
  
    provisioner "local-exec" {
        working_dir = path.module
        command = "rm -f ${local.zipfile}"
    
    }

    triggers = {
      lambda_pm = aws_lambda_function.pm.id
      output_file = data.archive_file.pm_zip.id
    }

  
}

resource "aws_lambda_function" "pm" {
    function_name = "pm_page"
    role = aws_iam_role.lambda_exec.arn

    filename = "${path.module}/${local.zipfile}"
    source_code_hash = data.archive_file.pm_zip.output_base64sha256
    handler = "pm.lambda_handler"
    runtime = "python3.8"

    environment {
      variables = {
        listener_arns = var.listener_arns,
        target_group_arn_pm = var.target_group_arn_pm,
        target_group_arn_service = var.target_group_arn_service
      }
    }

    tags = merge(
      var.tags,
      {
        "Name"  = "pm_lambda"
      },
    )

}

resource "aws_iam_role" "lambda_exec" {
   name = "lambda_exec"

   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}
