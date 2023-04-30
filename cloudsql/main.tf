resource "google_sql_database_instance" "user-db" {
  name                = "user-db"
  region              = var.project_region
  database_version    = "MYSQL_8_0"
  deletion_protection = false

  settings {
    tier                        = "db-f1-micro"
    disk_size                   = 10
    disk_autoresize             = false
    deletion_protection_enabled = false

    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "Allow from public"
        value = "0.0.0.0/0"
      }
    }

    user_labels = {
      "project" : "my-project-name"
    }
  }
}

resource "google_sql_user" "user-db-user" {
  instance = google_sql_database_instance.user-db.name
  name     = "admin"
  password = "admin"
}
