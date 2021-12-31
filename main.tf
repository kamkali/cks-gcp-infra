terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.0.0"
    }
  }
}

provider "google" {
  project = var.gcloud-project
  region  = var.gcloud-region
  zone    = var.gcloud-zone
}

module "network" {
  source          = "./network"
  gcloud-platform = var.gcloud-platform
  master-node     = var.master-node
  worker-1-node   = var.worker-1-node
}

module "cluster" {
  source          = "./cluster"
  main-subnetwork = module.network.main-subnetwork
  master-address  = module.network.master-address
  worker1-address = module.network.worker1-address
}

