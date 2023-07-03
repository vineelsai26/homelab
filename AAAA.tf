resource "cloudflare_record" "ip" {
  name    = "ip"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}
