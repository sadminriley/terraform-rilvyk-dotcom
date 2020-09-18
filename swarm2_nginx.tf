resource "digitalocean_droplet" "swarm2" {
  image = "ubuntu-18-04-x64"
  name ="swarm2.rilvyk.com"
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
      # Grab static html/js page from gist into html dir
      "sudo wget https://gist.githubusercontent.com/sadminriley/6a3f52b30f124c1e8dbae9f5b1eed847/raw/d46b0aac6f2fe5a7d178969b53168e8ed5caad49/index.html -P /var/www/html",
    ]
  }
}
