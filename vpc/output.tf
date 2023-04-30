output "vpc_name" {
  description = "VPC Name"
  value = google_compute_network.vpc_production.name
}
