resource "cloudflare_record" "netlify_ns1" {
  name    = "netlify"
  proxied = false
  ttl     = 3600
  type    = "NS"
  value   = "dns1.p01.nsone.net"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "netlify_ns2" {
  name    = "netlify"
  proxied = false
  ttl     = 3600
  type    = "NS"
  value   = "dns2.p01.nsone.net"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "netlify_ns3" {
  name    = "netlify"
  proxied = false
  ttl     = 3600
  type    = "NS"
  value   = "dns3.p01.nsone.net"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "netlify_ns4" {
  name    = "netlify"
  proxied = false
  ttl     = 3600
  type    = "NS"
  value   = "dns4.p01.nsone.net"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}
