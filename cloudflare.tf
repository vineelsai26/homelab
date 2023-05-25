resource "cloudflare_record" "catch_all_home" {
  name    = "*.home"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "10.0.0.145"
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

resource "cloudflare_record" "verify_bing" {
  name    = "73cbc6edc61fddc335a4765e56ec4d32"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "verify.bing.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_8033576b34392d97a90342635248f234" {
  name    = "acloled2losoaiyn3zxjxinf6qclsjvr._domainkey"
  proxied = false
  ttl     = 3600
  type    = "CNAME"
  value   = "acloled2losoaiyn3zxjxinf6qclsjvr.dkim.amazonses.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "algo" {
  name    = "algo"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "api_collab" {
  name    = "api.collab"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "collab.up.railway.app"
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

resource "cloudflare_record" "blog" {
  name    = "blog"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "collab" {
  name    = "collab"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
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

resource "cloudflare_record" "gogs" {
  name    = "gogs"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "de33d9bd-e78f-400c-ab8a-51fd50a50311.cfargotunnel.com"
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

resource "cloudflare_record" "nextcloud" {
  name    = "nextcloud"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "de33d9bd-e78f-400c-ab8a-51fd50a50311.cfargotunnel.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "portainer" {
  name    = "portainer"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "de33d9bd-e78f-400c-ab8a-51fd50a50311.cfargotunnel.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "privacy" {
  name    = "privacy"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
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

resource "cloudflare_record" "s145" {
  name    = "s145"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "de33d9bd-e78f-400c-ab8a-51fd50a50311.cfargotunnel.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "shortify" {
  name    = "shortify"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "shortify-vs.up.railway.app"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "amazonses_domainkey" {
  name    = "slg7cli4o536qdyhdphrvhivpas2ebfv._domainkey"
  proxied = false
  ttl     = 3600
  type    = "CNAME"
  value   = "slg7cli4o536qdyhdphrvhivpas2ebfv.dkim.amazonses.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "amazonses_domainkey_1" {
  name    = "sn6cjudhadoldlhxvpgtqail76zucccs._domainkey"
  proxied = false
  ttl     = 3600
  type    = "CNAME"
  value   = "sn6cjudhadoldlhxvpgtqail76zucccs.dkim.amazonses.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "ssh" {
  name    = "ssh"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "de33d9bd-e78f-400c-ab8a-51fd50a50311.cfargotunnel.com"
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
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "tictactoe" {
  name    = "tictactoe"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "vnc" {
  name    = "vnc"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "de33d9bd-e78f-400c-ab8a-51fd50a50311.cfargotunnel.com"
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

resource "cloudflare_record" "terraform_managed_resource_43672e5c1e6f32e30c73dcbdd7f9b4a4" {
  name     = "vineelsai.com"
  priority = 5
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "alt1.aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_53bd1aa5b3b6ba7e43591ce9352cad9d" {
  name     = "vineelsai.com"
  priority = 10
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "alt4.aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_8afb824099770ced7858b8a644ad1566" {
  name     = "vineelsai.com"
  priority = 5
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "alt2.aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_31ff9e9c710043b42b2e9b1836ac969e" {
  name     = "vineelsai.com"
  priority = 10
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "alt3.aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_46eeb4e0987f9f57afb8f462028e6982" {
  name     = "vineelsai.com"
  priority = 1
  proxied  = false
  ttl      = 3600
  type     = "MX"
  value    = "aspmx.l.google.com"
  zone_id  = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_56cc177160f7ae8b2f544855446a832c" {
  name    = "netlify"
  proxied = false
  ttl     = 3600
  type    = "NS"
  value   = "dns2.p01.nsone.net"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_e70902c5115d5db0508f20a2d060c0ee" {
  name    = "netlify"
  proxied = false
  ttl     = 3600
  type    = "NS"
  value   = "dns4.p01.nsone.net"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_57a59198eccc8a2a00afa59c952ba0dc" {
  name    = "netlify"
  proxied = false
  ttl     = 3600
  type    = "NS"
  value   = "dns1.p01.nsone.net"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_7260269f2bbae3e33b53537ba2c01739" {
  name    = "netlify"
  proxied = false
  ttl     = 3600
  type    = "NS"
  value   = "dns3.p01.nsone.net"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_cd93abc259d847f50a981df2ebd910b3" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=reject; sp=none; rua=mailto:5b5054640aef433192a0894df2245896@dmarc-reports.cloudflare.net,mailto:vineelsai26@gmail.com; rua=mailto:dmarc@mailinblue.com!10m; ruf=mailto:dmarc@mailinblue.com!10m; rf=afrf; pct=100; ri=86400"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_21dc1fa4306fbf5ba5eed2303c4b6586" {
  name    = "_github-pages-challenge-vineelsai26"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  value   = "66bb594c84008a9e1ee91a7798b052"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_8523d5bfab8c76402c693edae04a554b" {
  name    = "mail._domainkey"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDeMVIzrCa3T14JsNY0IRv5/2V1/v2itlviLQBwXsa7shBD6TrBkswsFUToPyMRWC9tbR/5ey0nRBH0ZVxp+lsmTxid2Y2z+FApQ6ra2VsXfbJP3HE6wAO0YTVEJt1TmeczhEd2Jiz/fcabIISgXEdSpTYJhb0ct0VJRxcg4c8c7wIDAQAB"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_8fa6a0a42e889c6027b24ae806077f0d" {
  name    = "vineelsai.com"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  value   = "google-site-verification=aDfG0Czr2aQh58x5KksuTjJ7N9HLUdriy2N76_C6_VE"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_bf75d5b10818503aca1c2eb544ba5abe" {
  name    = "vineelsai.com"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  value   = "v=spf1 include:_spf.google.com -all"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_6a2f55fb1a3c515e87a82a6283ff35e7" {
  name    = "vineelsai.com"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  value   = "google-site-verification=Dd177Dg0CMT4hcRRmPdketoAzQ-kZAdbQ5SYwENPVQU"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_0794bc0970864084e158e0536006d31d" {
  name    = "vineelsai.com"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  value   = "google-site-verification=iKocTEO41AehGKbLEgO_LaepDR6Zd2LKvRN77OVK2Xs"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_53847af078f45ab162fbfc10ef082f66" {
  name    = "vineelsai.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "have-i-been-pwned-verification=6ca260fac504238160cc8fc87c81f628"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_ed86d8055d9367904c1951b0c7581d89" {
  name    = "_visual-studio-marketplace-vineelsai"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "cd1f1949-69dc-43b8-bb74-bcdb1eedabe7"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "terraform_managed_resource_3df785b2667f1a84fcc0c5936a8aec93" {
  name    = "ip"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}
