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
