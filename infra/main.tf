provider "google" {
  project = "gcp-devops-gke-project"
  region  = "us-central1"
  credentials = "./keys.json"
}

resource "google_container_cluster" "primary" {
  name     = "gke-cluster"
  location = "us-central1-a"

  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
