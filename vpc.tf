variable "project_id" {
  description = "mycluster"
}

variable "region" {
  description = "region"
}

provider "google" {
  project = "skilled-clover-355610"
  region  = "us-central1"
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = true
  mtu                     = 1500
  
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}


resource "docker_network" "private_network" {
  name = "MyBridgedNetwork"


}
/*
resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name = "example-ingress"
  }

  spec {
    backend {
      service_name = "myapp-1"
      service_port = 8080
    }

    rule {
      http {
        path {
          backend {
            service_name = "myapp-1"
            service_port = 8080
          }

          path = "/app1/*"
        }

        path {
          backend {
            service_name = "myapp-2"
            service_port = 8080
          }

          path = "/app2/*"
        }
      }
    }

    tls {
      secret_name = "tls-secret"
    }
  }
}

resource "kubernetes_service_v1" "example" {
  metadata {
    name = "myapp-1"
  }
  spec {
    selector = {
      app = kubernetes_pod.example.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "NodePort"
  }
}

resource "kubernetes_service_v1" "example2" {
  metadata {
    name = "myapp-2"
  }
  spec {
    selector = {
      app = kubernetes_pod.example2.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "NodePort"
  }
}
*/
resource "kubernetes_pod" "example" {
  metadata {
    name = "nginx"
    labels = {
      app = "MyCluster"
    }
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "Server MyCluster"

      port {
        container_port = 8080
      }
    }
  }
}
/*
resource "kubernetes_pod" "example2" {
  metadata {
    name = "terraform-example2"
    labels = {
      app = "myapp-2"
    }
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "example"

      port {
        container_port = 8080
      }
    }
  }
}*/