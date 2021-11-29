output "main-subnetwork" {
  value = google_compute_subnetwork.cks-cluster-network.self_link
}
