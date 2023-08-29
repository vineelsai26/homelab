resource "cloudflare_record" "root" {
  name    = "vineelsai.com"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "76.76.21.21"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "api_collab" {
  name    = "api.collab"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "144.24.141.117"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "rce" {
  name    = "rce"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "144.24.141.117"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "shortify" {
  name    = "shortify"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "144.24.141.117"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "uptime" {
  name    = "uptime"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "144.24.141.117"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}
