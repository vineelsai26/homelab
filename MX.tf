resource "cloudflare_record" "mx" {
  name     = "vineelsai.com"
  priority = 1
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "mx1" {
  name     = "vineelsai.com"
  priority = 5
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "alt1.aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "mx2" {
  name     = "vineelsai.com"
  priority = 5
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "alt2.aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "mx3" {
  name     = "vineelsai.com"
  priority = 10
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "alt3.aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "mx4" {
  name     = "vineelsai.com"
  priority = 10
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "alt4.aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "bounces_mx" {
  name     = "bounces"
  priority = 10
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "feedback-smtp.us-east-1.amazonses.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}
