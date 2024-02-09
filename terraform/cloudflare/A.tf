resource "cloudflare_record" "root" {
  name    = "vineelsai.com"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "76.76.21.21"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "blog_1" {
  name    = "blog"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "162.159.153.4"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "blog_2" {
  name    = "blog"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "162.159.152.4"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "home" {
  name    = "*.home"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "10.0.0.10"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "oc" {
  name    = "*.oc"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "100.84.60.101"
  zone_id = var.zone_id
  comment = var.default_comment
}
