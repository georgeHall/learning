terraform {
  backend "gcs" {}

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.15.0"
    }
    publicip = {
      source  = "nxt-engineering/publicip"
      version = "0.0.9"
    }
  }
}


variable "gcp_project" {
  type = string
}

provider "google" {
  project = var.gcp_project
  region  = var.region
  zone    = "${var.region}-a"
}

provider "publicip" {}
