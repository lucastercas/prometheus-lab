provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = var.ssh_key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "digitalocean_project" "playground" {
  name        = "Monitoring Laboratory"
  description = "Monitoring Laboratory"
  purpose     = "Laboratory for testing monitoring"
  environment = "Development"

}

resource "digitalocean_project_resources" "droplets" {
  project = digitalocean_project.playground.id
  resources = concat(
    digitalocean_droplet.master.*.urn,
    digitalocean_droplet.worker.*.urn,
    digitalocean_droplet.monitored.*.urn,
  )

}

resource "digitalocean_project_resources" "domains" {
  project = digitalocean_project.playground.id
  resources = [
    digitalocean_domain.default.urn
  ]
}
