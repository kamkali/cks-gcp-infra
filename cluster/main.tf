resource "google_compute_instance" "master" {
  machine_type = "e2-medium"
  zone         = var.gcloud-zone
  name         = "master-node"
  boot_disk {
    initialize_params {
      size  = 20
      image = "ubuntu-1804-bionic-v20211115"
    }
  }
  network_interface {
    subnetwork = var.main-subnetwork
    access_config {}
  }

  metadata = {
    ssh-keys = join("\n", [for key in var.ssh_keys : "${key.user}:${key.publickey}"])
  }
}
