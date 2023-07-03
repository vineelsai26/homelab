resource "cloudflare_record" "catch_all_home" {
  name    = "*.home"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "10.0.0.80"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "root" {
  name    = "vineelsai.com"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "76.76.21.21"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}
