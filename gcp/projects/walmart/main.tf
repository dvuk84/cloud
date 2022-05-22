#
# MAIN
#

terraform {
  required_version 	= ">= 1.0.0"

  required_providers {
    google = {
      source		= "hashicorp/google"
      version		= ">= 3.5.0"
    }
  }
}

provider "google" {
  credentials		= file("./service-account.json")
  project 		= "${var.project}"
  region		= "${var.region}"
}

#
# PROJECT
#

module "modules" {
  source                = "../../modules/"

  vpc			= "vpc-network-1"
  project		= "default-project-2022"
  environment		= "production"
}
