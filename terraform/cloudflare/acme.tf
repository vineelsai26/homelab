resource "cloudflare_record" "_acme_challenge_api_rce" {
  name    = "_acme-challenge.api.rce"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "api.rce.vineelsai.dev.865n5e.flydns.net"
  zone_id = var.zone_id_vineelsai_dev
  comment = var.default_comment
}

resource "cloudflare_record" "_acme_challenge_shortify" {
  name    = "_acme-challenge.api.shortify"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "shortify.vineelsai.dev.865yje.flydns.net"
  zone_id = var.zone_id_vineelsai_dev
  comment = var.default_comment
}

resource "cloudflare_record" "_acme_challenge_api_collab" {
  name    = "_acme-challenge.api.collab"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "api.collab.vineelsai.dev.gj23x0.flydns.net"
  zone_id = var.zone_id_vineelsai_dev
  comment = var.default_comment
}
