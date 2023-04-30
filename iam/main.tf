resource "google_project_iam_binding" "editor" {
  project = var.project_id
  role = "roles/editor"
  members = var.second_admin
}
