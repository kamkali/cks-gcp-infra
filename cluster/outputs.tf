output "master-node-endpoint" {
  value = google_compute_instance.master.network_interface[0].access_config[0].nat_ip
}

output "worker-1-node-endpoint" {
  value = google_compute_instance.worker1.network_interface[0].access_config[0].nat_ip
}