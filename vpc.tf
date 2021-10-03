// create resources on GCP
// terraform script for creating vpc network in GCP

provider "google" {
    project     = "PROJECTID"
}
 
resource "google_compute_network" "vpc_network" {
  project = "PROJECTID"
  name = "vpc-network-terraform"
  auto_create_subnetworks = false
  mtu  = 1500
}
  