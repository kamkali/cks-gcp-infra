variable "gcloud-region" {
  default = "europe-central2"
}

variable "ssh_keys" {
  type = list(object({
    publickey = string
    user      = string
  }))
  description = "list of public ssh keys that have access to the VM"
  default = [
    {
      user      = "ubuntu"
      publickey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF1jKpP554zIHZnHMcXa9dha3rif3wBAd0KU26S3AuKc6frCoUUVFYcnwu7AnwxDiykGZC69tdIxDCyu7jJfEyp1Oet+gMFo4cMsSeSVKVvZ0Z19fSvVhPIugBMhcm8XIgZ7XD6mByPQKBGCxx2a9W9o73WzInAMRWyDhKuElc5ADIjDejinyDLRDsl47DPgGfE/0EdxNB5he45NniD56VLUYKQecIJq4IuePCVGkJ3vFMP9+ktsgxW/X3iZMDJZtovkz3INupirF/lxsrmJvgzQyCftE0ezBMqY24XmLIm2q46nR6k4uqbv3d3XKmgODkMqNS8Sj8OtreTrUe3X45 kamilkalis@MacBook-Pro-Kamil.local"
    }
  ]
}

variable "main-subnetwork" {
  type = string
}

variable "gcloud-zone" {
  default = "europe-central2-a"
}

variable "gcloud-project" {
  default = "CKS-training"
}

variable "gcloud-platform" {
  default = "cks-gcp-platform"
}

variable "master-address" {
  type = string
}

variable "worker1-address" {
  type = string
}