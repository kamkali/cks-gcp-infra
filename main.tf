terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.0.0"
    }
  }
}

provider "google" {
  project     = var.gcloud-project
  region      = var.gcloud-region
  zone        = var.gcloud-zone
}

module "network" {
  source               = "./network"
  gcloud-platform      = var.gcloud-platform
  master-node-endpoint = module.cluster.master-node-endpoint
}

module "cluster" {
  source          = "./cluster"
  main-subnetwork = module.network.main-subnetwork
}

