provider "google" {
  credentials = file("<path-to-service-account-key>.json") # Replace with your GCP JSON key file
  project     = "<your-gcp-project-id>"
  region      = "us-central1"
}

resource "google_container_cluster" "primary" {
  name               = "kubernetes-cluster"
  location           = "us-central1"
  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
  }
}

output "kubeconfig" {
  value = google_container_cluster.primary.kubeconfig_raw
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "myapp" {
  name       = "myapp"
  chart      = "./myapp" # Path to your Helm chart
  namespace  = "default"
  values = [
    file("values.yaml")
  ]
}

