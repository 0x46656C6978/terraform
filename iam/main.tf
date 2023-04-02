module "global" {
  source = "../global"
}

resource "google_project_iam_binding" "editor" {
  project = module.global.project_id
  role = "roles/editor"
  members = [module.global.second_admin]
}
