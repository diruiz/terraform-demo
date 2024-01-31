# Create a new domain
resource "digitalocean_domain" "diegokbsdomain" {
  name = "diegokbstestdo.com"
}

# Add a record to the domain
resource "digitalocean_record" "www" {
  domain = "${digitalocean_domain.diegokbsdomain.name}"
  type   = "A"
  name   = "www"
  ttl    = "50"
  value  = "${digitalocean_loadbalancer.public.ip}"
}