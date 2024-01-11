output "repo_cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.repo_s3_distribution.id
}

output "repo_cloudfront_distribution_arn" {
  value = aws_cloudfront_distribution.repo_s3_distribution.arn
}

output "repo_cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.repo_s3_distribution.domain_name
}

output "repo_acm_resource_record_name" {
  value = module.repo_acm.resource_record_name
}

output "repo_acm_resource_record_type" {
  value = module.repo_acm.resource_record_type
}

output "repo_acm_resource_record_value" {
  value = module.repo_acm.resource_record_value
}
