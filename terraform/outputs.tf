output "master-info" {
  value = "${formatlist(
    "%s => %s - %s",
    (digitalocean_droplet.master.*.name),
    (digitalocean_droplet.master.*.ipv4_address),
    (digitalocean_droplet.master.*.ipv4_address_private),
  )}"
}

output "worker-info" {
  value = "${formatlist(
    "%s => %s - %s",
    (digitalocean_droplet.worker.*.name),
    (digitalocean_droplet.worker.*.ipv4_address),
    (digitalocean_droplet.worker.*.ipv4_address_private),
  )}"
}

output "monitored-info" {
  value = "${formatlist(
    "%s => %s - %s",
    (digitalocean_droplet.monitored.*.name),
    (digitalocean_droplet.monitored.*.ipv4_address),
    (digitalocean_droplet.monitored.*.ipv4_address_private),
  )}"
}

