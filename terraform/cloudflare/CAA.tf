resource "cloudflare_record" "acm_repo" {
  name    = data.terraform_remote_state.aws_prod.outputs.repo_acm_resource_record_name
  proxied = false
  ttl     = 1
  type    = data.terraform_remote_state.aws_prod.outputs.repo_acm_resource_record_type
  value   = data.terraform_remote_state.aws_prod.outputs.repo_acm_resource_record_value
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}
