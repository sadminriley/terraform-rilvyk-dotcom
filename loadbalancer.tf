resource "digitalocean_loadbalancer" "rilvyk-lb" {
  name = "rilvyk-lb"
  region = "nyc3"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    port = 22
    protocol = "tcp"
  }

  droplet_ids = [ digitalocean_droplet.swarm.id, digitalocean_droplet.swarm2.id ]
}
