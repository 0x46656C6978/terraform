terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.59.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}

module "iam" {
  source = "./iam"
}

module "vpc" {
  source = "./vpc"
}

module "cloudsql" {
  source = "./cloudsql"
}

# module "compute-engine" {
#   source = "./compute-engine"
#   depends_on = [
#     module.vpc
#   ]
# }
