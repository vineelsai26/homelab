resource "aws_s3_bucket" "repo" {
  bucket = "repo.vineelsai.com"

  tags = {
    Name        = "S3 Bucket for repo"
    Environment = "Terraform"
  }
}
