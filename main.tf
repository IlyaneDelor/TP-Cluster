/*terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.17.0"
    }
  }
}*/
# Configure provider

provider "docker" {
 host = "npipe:////.//pipe//docker_engine"

}   
resource "docker_image" "MyCluster" {
  name          = "mycluster"
  build {
    path        = "./"
  }
}/*
resource "docker_image" "nginx" {
  name = "nginx:stable-alpine"
}
resource "docker_network" "nginx" {
  name   = "MyBridgedNetwork"
  driver = "bridge"
}*/
