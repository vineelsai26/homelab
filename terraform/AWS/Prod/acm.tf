module "repo_acm" {
  providers = {
    aws = aws.aws_virginia
  }
  source            = "./modules/acm"
  domain_name       = "repo.vineelsai.com"
  validation_method = "DNS"
}
