provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "Bandit SSH Key"
  public_key = file("~/.ssh/id_rsa.pub")
}
