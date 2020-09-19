resource "digitalocean_droplet" "swarm" {
  image = "ubuntu-18-04-x64"
  name ="swarm.rilvyk.com"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  private_networking = true
  # count = 0
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt-get update",
      "sudo apt-get -y install nginx",
    ]
  }
  provisioner "file" {
    source = "${path.module}/./index.html"
    destination = "/var/www/html/index.html"
  }
}
