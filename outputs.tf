output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.MyCluster.name
  description = "MyCluster"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.MyCluster.endpoint
  description = "MyCluster"
}
