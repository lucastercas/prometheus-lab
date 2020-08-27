resource "digitalocean_firewall" "default" {
  name  = "default-firewall"
  count = 1
  droplet_ids = concat(
    digitalocean_droplet.monitored.*.id,
    digitalocean_droplet.master.*.id,
    digitalocean_droplet.worker.*.id
  )

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

resource "digitalocean_firewall" "monitored" {
  name        = "monitored-firewall"
  count       = 1
  droplet_ids = concat(digitalocean_droplet.monitored.*.id)
  inbound_rule {
    protocol         = "tcp"
    port_range       = "9100"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}

resource "digitalocean_firewall" "master_nodes" {
  name        = "master-nodes-firewall"
  count       = 1
  droplet_ids = concat(digitalocean_droplet.master.*.id)
  inbound_rule {
    protocol         = "tcp"
    port_range       = "6443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}

# resource "digitalocean_firewall" "worker_nodes" {
#   name  = "worker-nodes-firewall"
#   count = 1
#   droplet_ids = concat(digitalocean_droplet.worker.*.id)
# }
