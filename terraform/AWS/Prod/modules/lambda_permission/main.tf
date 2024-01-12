resource "aws_lambda_permission" "default_cloudfront_lambda" {
  statement_id  = var.statement_id
  action        = var.action
  function_name = var.function_name
  principal     = var.principal
  qualifier     = var.qualifier
  source_arn   = var.source_arn
}
