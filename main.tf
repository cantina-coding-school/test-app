terraform {
	required_providers {
	   google = {
	      source = "hashicorp/google"
	      version = "3.5.0"
	   }
	}
}

provider "google" {
	credentials = file("prefab-poetry-335109-d56063b33b61.json")

	project = "prefab-poetry-335109"
	region = "europe-west"
	zone = "europe-west3-c"
}

resource "google_compute_network" "vpc_network" {
	name = "terraform-network"
}