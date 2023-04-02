terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.59.0"
    }
  }
}

provider "google" {
  project = module.global.project_id
  region  = module.global.project_region
  zone    = module.global.project_zone
}

module "global" {
  source = "./global"
}

module "iam" {
  source = "./iam"
}

module "vpc" {
  source = "./vpc"
}

module "compute-engine" {
  source = "./compute-engine"
  depends_on = [
    module.vpc
  ]
}
