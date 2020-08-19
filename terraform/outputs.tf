output "loadbalancer_public" {
  value = [digitalocean_droplet.loadbalancer.*.ipv4_address]
}
output "controlplane_public" {
  value = [digitalocean_droplet.master.*.ipv4_address]
}
output "workers_public" {
  value = [digitalocean_droplet.worker.*.ipv4_address]
}

output "loadbalancer_private" {
  value = [digitalocean_droplet.loadbalancer.*.ipv4_address_private]
}
output "controlplane_private" {
  value = [digitalocean_droplet.master.*.ipv4_address_private]
}
output "workers_private" {
  value = [digitalocean_droplet.worker.*.ipv4_address_private]
}