terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("prefab-poetry-335109-d56063b33b61.json")

  project = "prefab-poetry-335109"
  region  = "europe-west"
  zone    = "europe-west3-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
      initialize_params {
          image = "debian-cloud/debian-9"
      }
  }

  network_interface {
      network = google_compute_network.vpc_network.name
      access_config {
      
      }
  }
}