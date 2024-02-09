output "arn" {
  value = aws_acm_certificate.cert.arn
}

output "domain_name" {
  value = aws_acm_certificate.cert.domain_name
}

output "resource_record_name" {
  value = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name
}

output "resource_record_type" {
  value = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_type
}

output "resource_record_value" {
  value = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value
}
