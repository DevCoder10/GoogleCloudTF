// create resources on GCP
// terraform script for creating kubernetes cluster in GCP

provider "google" {
    project     = "PROJECTID"
}

resource "google_service_account" "default" {
  account_id   = "PROJECTID"
  display_name = "test-terraform2"
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster2"
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


