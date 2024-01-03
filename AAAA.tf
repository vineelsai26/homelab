resource "cloudflare_record" "ip" {
  name    = "ip"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = var.zone_id
  comment = var.default_comment
}
