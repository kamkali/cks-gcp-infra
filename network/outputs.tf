output "main-subnetwork" {
  value = google_compute_subnetwork.cks-cluster-network.self_link
}

output "master-address" {
  value = google_compute_address.master.address
}

output "worker1-address" {
  value = google_compute_address.worker1.address
}