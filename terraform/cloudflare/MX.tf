resource "cloudflare_record" "mx1" {
  name     = "vineelsai.com"
  priority = 1
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "mx01.mail.icloud.com"
  zone_id  = var.zone_id
  comment  = var.default_comment
}

resource "cloudflare_record" "mx2" {
  name     = "vineelsai.com"
  priority = 1
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "mx02.mail.icloud.com"
  zone_id  = var.zone_id
  comment  = var.default_comment
}
