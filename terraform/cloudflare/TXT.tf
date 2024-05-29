resource "cloudflare_record" "_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=reject; sp=reject; rua=mailto:5b5054640aef433192a0894df2245896@dmarc-reports.cloudflare.net; rf=afrf; pct=100; ri=86400"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}

resource "cloudflare_record" "mail_domainkey" {
  name    = "mail._domainkey"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDeMVIzrCa3T14JsNY0IRv5/2V1/v2itlviLQBwXsa7shBD6TrBkswsFUToPyMRWC9tbR/5ey0nRBH0ZVxp+lsmTxid2Y2z+FApQ6ra2VsXfbJP3HE6wAO0YTVEJt1TmeczhEd2Jiz/fcabIISgXEdSpTYJhb0ct0VJRxcg4c8c7wIDAQAB"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}

resource "cloudflare_record" "_visual_studio_marketplace_vineelsai" {
  name    = "_visual-studio-marketplace-vineelsai"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "cd1f1949-69dc-43b8-bb74-bcdb1eedabe7"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}

resource "cloudflare_record" "github_vineelsai26_domain_verification" {
  name    = "_github-pages-challenge-vineelsai26"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "66bb594c84008a9e1ee91a7798b052"
  zone_id = var.zone_id_vineelsai_com
  comment = var.default_comment
}
