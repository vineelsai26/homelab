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

resource "cloudflare_record" "material" {
  name    = "material"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "material-design-icons.pages.dev"
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

resource "cloudflare_record" "shortify" {
  name    = "shortify"
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

resource "cloudflare_record" "www" {
  name    = "www"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

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

resource "cloudflare_record" "_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=reject; sp=none; rua=mailto:5b5054640aef433192a0894df2245896@dmarc-reports.cloudflare.net; rf=afrf; pct=100; ri=86400"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "mail_domainkey" {
  name    = "mail._domainkey"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDeMVIzrCa3T14JsNY0IRv5/2V1/v2itlviLQBwXsa7shBD6TrBkswsFUToPyMRWC9tbR/5ey0nRBH0ZVxp+lsmTxid2Y2z+FApQ6ra2VsXfbJP3HE6wAO0YTVEJt1TmeczhEd2Jiz/fcabIISgXEdSpTYJhb0ct0VJRxcg4c8c7wIDAQAB"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "bounces_txt" {
  name    = "bounces"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com ~all"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "resend_domainkey" {
  name    = "resend._domainkey"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCoAHnu+EG51z8b/980XwDfMayFHlDjxTR9YCnikzscJAWlEQL6nsIfGAK4H9YFSHajZrei8HTlLZDJuooiUpUfLaKpP9o719JbQPhrk7Vnxa7GkhOkmRZ8eiW5KIOombHKqOYiIowEOJgFUFpfnVlaKkh+EG7bio64KIabI1OnQQIDAQAB"
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

resource "cloudflare_record" "github_vineelsai26_domain_verification" {
  name    = "_github-pages-challenge-vineelsai26"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "66bb594c84008a9e1ee91a7798b052"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}

resource "cloudflare_record" "ip" {
  name    = "ip"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = "774c57de3172a6220c23461a2992c3a8"
}
