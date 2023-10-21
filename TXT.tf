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

resource "cloudflare_record" "terraform_managed_resource_bf75d5b10818503aca1c2eb544ba5abe" {
  name    = "vineelsai.com"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  value   = "v=spf1 include:icloud.com ~all"
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
