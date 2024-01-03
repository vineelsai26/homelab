resource "cloudflare_record" "mx1" {
  name     = "vineelsai.com"
  priority = 1
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "mx01.mail.icloud.com"
  zone_id  = var.zone_id
  tags     = [var.default_tag]
}

resource "cloudflare_record" "mx2" {
  name     = "vineelsai.com"
  priority = 1
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "mx02.mail.icloud.com"
  zone_id  = var.zone_id
  tags     = [var.default_tag]
}

resource "cloudflare_record" "bounces_mx" {
  name     = "bounces"
  priority = 10
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "feedback-smtp.us-east-1.amazonses.com"
  zone_id  = var.zone_id
  tags     = [var.default_tag]
}
