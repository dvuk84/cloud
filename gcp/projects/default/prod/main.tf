#
# MAIN
#

terraform {
  required_version		= ">=1.0.0"

  required_providers {
    google = {
      source			= "hashicorp/google"
      version			= "=4.22.0"
    }
  }

  #backend "gcs" {}
}

provider "google" {
  credentials			= file("${var.credentials_file}")
  project			= "${var.project}"
  region			= "${var.region}"
}

#
# MODULES
#

module "vpc" {
  source			= "../../../modules/vpc"
  project			= "${var.project}"
  region			= "${var.region}"
  vpc				= "${var.vpc}"
}

module "firewall" {
  source			= "../../../modules/firewall"
  vpc_id			= module.vpc.google_compute_network_vpc
  jumphost_in			= "${var.jumphost_in}"
}

module "jumphost" {
  source			= "../../../modules/jumphost"
  subnet_jumphost		= module.vpc.google_compute_subnetwork_jumphost
}

module "compute" {
  source			= "../../../modules/compute"
  subnet_a			= module.vpc.google_compute_subnetwork_a
  subnet_b			= module.vpc.google_compute_subnetwork_b
  subnet_c			= module.vpc.google_compute_subnetwork_c
  compute_group			= "${var.compute_group}"
}
