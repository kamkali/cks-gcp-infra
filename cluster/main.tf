resource "google_compute_instance" "master" {
  machine_type              = "e2-standard-2"
  zone                      = var.gcloud-zone
  name                      = "master-node"
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      size  = 20
      image = "ubuntu-1804-bionic-v20211115"
    }
  }
  network_interface {
    subnetwork = var.main-subnetwork
    access_config {
      nat_ip = var.master-address
    }
  }

  metadata = {
    ssh-keys = join("\n", [for key in var.ssh_keys : "${key.user}:${key.publickey}"])
  }
}


resource "google_compute_instance" "worker1" {
  machine_type              = "e2-standard-2"
  zone                      = var.gcloud-zone
  name                      = "worker-1-node"
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      size  = 15
      image = "ubuntu-1804-bionic-v20211115"
    }
  }
  network_interface {
    subnetwork = var.main-subnetwork
    access_config {
      nat_ip = var.worker1-address
    }
  }

  metadata = {
    ssh-keys = join("\n", [for key in var.ssh_keys : "${key.user}:${key.publickey}"])
  }
}
