resource "cloudflare_record" "ip" {
  name    = "ip"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}

resource "cloudflare_record" "link" {
  name    = "link"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}

resource "cloudflare_record" "static" {
  name    = "static"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}
