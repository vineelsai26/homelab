data "archive_file" "dl_viewer_request_lambda" {
  type        = "zip"
  source_file = "lambda/dl-viewer-request/main.py"
  output_path = "dl_viewer_request_lambda.zip"
}

module "default_cloudfront_lambda" {
  source        = "./modules/lambda_permission"
  statement_id  = "AllowExecutionFromCloudFront"
  action        = "lambda:InvokeFunction"
  function_name = module.dl_viewer_request_lambda.function_name
  principal     = "edgelambda.amazonaws.com"
  qualifier     = module.dl_viewer_request_lambda.version
  source_arn    = aws_cloudfront_distribution.repo_s3_distribution.arn
  providers = {
    aws = aws.aws_virginia
  }
}

module "dl_viewer_request_lambda" {
  source           = "./modules/lambda"
  filename         = "dl_viewer_request_lambda.zip"
  function_name    = "dl_viewer_request_lambda"
  handler          = "main.lambda_handler"
  depends_on       = [data.archive_file.dl_viewer_request_lambda]
  source_code_hash = data.archive_file.dl_viewer_request_lambda.output_base64sha256
  runtime          = "python3.12"
  publish          = true
  role             = aws_iam_role.default_iam_for_lambda.arn
  providers = {
    aws = aws.aws_virginia
  }
}
