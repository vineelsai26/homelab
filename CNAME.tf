resource "cloudflare_record" "verify_bing" {
  name    = "73cbc6edc61fddc335a4765e56ec4d32"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "verify.bing.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "algo" {
  name    = "algo"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "algo-47m.pages.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "archive1" {
  name    = "archive1"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "portfolio-archive-1.pages.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "archive2" {
  name    = "archive2"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "portfolio-archive-2.pages.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "archive3" {
  name    = "archive3"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "portfolio-archive-3.pages.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "archive4" {
  name    = "archive4"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "portfolio-archive-4.pages.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "balance" {
  name    = "balance"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "balance-sheet-generator.pages.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "_domainconnect" {
  name    = "_domainconnect"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "connect.domains.google.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "material" {
  name    = "material"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "material-design-icons.pages.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "repo" {
  name    = "repo"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "static" {
  name    = "static"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "public.r2.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "stats_github" {
  name    = "stats.github"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "sudoku" {
  name    = "sudoku"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "sudoku-web.pages.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "tictactoe" {
  name    = "tictactoe"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "tic-tac-toe-web.pages.dev"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "www" {
  name    = "www"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "amazonses_domainkey_1" {
  name            = "acloled2losoaiyn3zxjxinf6qclsjvr._domainkey"
  proxied         = false
  ttl             = 1
  type            = "CNAME"
  value           = "acloled2losoaiyn3zxjxinf6qclsjvr.dkim.amazonses.com"
  zone_id         = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "amazonses_domainkey_2" {
  name            = "sn6cjudhadoldlhxvpgtqail76zucccs._domainkey"
  proxied         = false
  ttl             = 1
  type            = "CNAME"
  value           = "sn6cjudhadoldlhxvpgtqail76zucccs.dkim.amazonses.com"
  zone_id         = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "amazonses_domainkey_3" {
  name            = "slg7cli4o536qdyhdphrvhivpas2ebfv._domainkey"
  proxied         = false
  ttl             = 1
  type            = "CNAME"
  value           = "slg7cli4o536qdyhdphrvhivpas2ebfv.dkim.amazonses.com"
  zone_id         = "774c57de3172a6220c23461a2992c3a8"
}
