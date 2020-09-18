resource "digitalocean_domain" "default" {
   name = "rilvyk.com"
   ip_address = digitalocean_loadbalancer.rilvyk-lb.ip
}

resource "digitalocean_record" "CNAME-www" {
  domain = digitalocean_domain.default.name
  type = "CNAME"
  name = "www"
  value = "@"
}

resource "digitalocean_record" "A-moon" {
  domain = digitalocean_domain.default.name
  type = "A"
  name = "moon"
  value = "157.245.13.106"
}
