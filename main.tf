/*
resource "google_compute_network" "vpc_network" {
  project = "ecstatic-backup-319018"
  name = "vpc-network-terraform"
  auto_create_subnetworks = false
  mtu  = 1500
}
resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  count=3
  name          = "test-network-${count.index}"
  ip_cidr_range = var.range[count.index]
  region        = var.sub_name[count.index]
  network       = google_compute_network.vpc_network.self_link*/
  

/*resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}
*/

provider "google" {
    project     = "ecstatic-backup-319018"
}

resource "google_service_account" "pcs" {
  account_id   = "ecstatic-backup-319018"
  display_name = "test-terraform2"
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-central1"

  
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  
}
