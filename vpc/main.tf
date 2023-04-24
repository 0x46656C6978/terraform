resource "google_compute_network" "vpc-production" {
  project = var.project_id
  name = "vpc-production"
  description = "VPC for production services"
  routing_mode = "REGIONAL"
}

resource "google_compute_firewall" "fw-production-allow-http" {
  name = "production-allow-http"
  network = google_compute_network.vpc-production.name
  allow {
    protocol = "tcp"
    ports = [ "80", "443" ]
  }
  source_tags = [ "vpc-production-default" ]
  source_ranges = [ "0.0.0.0/0" ]
  target_tags = [ "http", "https", "allow-http" ]
}

resource "google_compute_firewall" "fw-production-allow-ssh" {
  name = "production-allow-ssh"
  network = google_compute_network.vpc-production.name
  allow {
    protocol = "tcp"
    ports = [ "22" ]
  }
  source_tags = [ "vpc-production-default" ]
  source_ranges = [ "0.0.0.0/0" ]
  target_tags = [ "allow-ssh" ]
}
