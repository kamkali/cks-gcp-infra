resource "google_compute_network" "platform" {
  name = var.gcloud-platform
}

resource "google_compute_subnetwork" "cks-cluster-network" {
  ip_cidr_range = "10.0.1.0/24"
  name          = "cks-${var.gcloud-platform}-${var.gcloud-region}"
  network       = google_compute_network.platform.self_link
  region        = var.gcloud-region
}


resource "google_compute_firewall" "allow-all" {
  name    = "${var.gcloud-platform}-allow-all"
  network = google_compute_network.platform.name

  allow {
    protocol = "all"
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_dns_managed_zone" "platform-dns" {
  dns_name    = "kakal.pl."
  name        = "cks-training-kakal-pl"
  description = "cks-training-kkal.com DNS zone"
}

resource "google_dns_record_set" "dev-k8s-endpoint-platform-dns" {
  name = "k8s.${google_dns_managed_zone.platform-dns.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.platform-dns.name

  rrdatas = [var.master-node-endpoint]
}

resource "google_dns_record_set" "dev-worker1-endpoint-dns" {
  name = "worker.1.${google_dns_managed_zone.platform-dns.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.platform-dns.name

  rrdatas = [var.worker-1-node-endpoint]
}