data "aws_iam_policy_document" "read_repo_bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.repo.arn}/*"]
    effect    = "Allow"
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.repo_s3_distribution.arn]
    }
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
  }
}

resource "aws_s3_bucket_policy" "repo" {
  bucket = aws_s3_bucket.repo.id
  policy = data.aws_iam_policy_document.read_repo_bucket.json
}

###############################################################################
# Default Lambda IAM Role and Policy                                          #
###############################################################################
data "aws_iam_policy_document" "lambda_assume_role_doc" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "default_iam_for_lambda" {
  name               = "default_iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_doc.json
}

data "aws_iam_policy_document" "lambda_role_doc" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:ListObjects",
      "s3:ListBucket"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "default_policy_for_lambda" {
  name        = "lambda_default_policy"
  path        = "/"
  description = "Default IAM policy for lambda"
  policy      = data.aws_iam_policy_document.lambda_role_doc.json
}

resource "aws_iam_role_policy_attachment" "default_role_for_lambda" {
  role       = aws_iam_role.default_iam_for_lambda.name
  policy_arn = aws_iam_policy.default_policy_for_lambda.arn
}
