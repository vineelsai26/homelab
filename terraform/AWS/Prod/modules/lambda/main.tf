resource "aws_lambda_function" "lambda" {
  filename         = var.filename
  function_name    = var.function_name
  handler          = var.handler
  source_code_hash = var.source_code_hash
  role             = var.role
  runtime          = var.runtime
  publish          = var.publish
  tags = {
    Environment = "Terraform"
  }
}
