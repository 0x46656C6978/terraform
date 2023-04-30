resource "google_compute_instance" "backend-server" {
  zone = var.project_zone
  project = var.project_id
  name = "backend-server-e2-micro"
  machine_type = "e2-micro"
  network_interface {
    network = "vpc-production"
    access_config {}
  }
  boot_disk {
    auto_delete = true
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      type = "pd-standard"
      size = 10
    }
  }
  tags = [ "allow-http", "allow-ssh" ]
}
