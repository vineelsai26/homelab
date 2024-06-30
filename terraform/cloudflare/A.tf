resource "cloudflare_record" "root" {
  name    = "vineelsai.com"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "76.76.21.21"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}

resource "cloudflare_record" "root_dev" {
  name    = "vineelsai.dev"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "76.76.21.21"
  zone_id = var.zone_id_vineelsai_dev
  comment = var.default_comment
}

resource "cloudflare_record" "home" {
  name    = "*.home"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "10.0.0.80"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}

resource "cloudflare_record" "oc" {
  name    = "*.oc"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "100.84.60.101"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}
