terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.52.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.17.0"
  }

  

  

  }

  required_version = ">= 0.14"
}

