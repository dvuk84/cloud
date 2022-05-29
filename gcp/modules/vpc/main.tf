#
# VPC
#

resource "google_compute_network" "vpc_network" {
  project			= "${var.project}"
  name				= "${var.vpc}"
  auto_create_subnetworks	= false
  routing_mode			= "REGIONAL"
}

resource "google_compute_subnetwork" "subnet_a" {
  name				= "subnet-a"
  ip_cidr_range			= "${var.subnet_a_cidr}"
  region			= "${var.subnet_a_region}"
  network			= google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_b" {
  name                          = "subnet-b"
  ip_cidr_range                 = "${var.subnet_b_cidr}"
  region                        = "${var.subnet_b_region}"
  network                       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_c" {
  name                          = "subnet-c"
  ip_cidr_range                 = "${var.subnet_c_cidr}"
  region                        = "${var.subnet_c_region}"
  network                       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_jumphost" {
  name                          = "subnet-jumphost"
  ip_cidr_range                 = "${var.subnet_jumphost_cidr}"
  region                        = "${var.subnet_jumphost_region}"
  network                       = google_compute_network.vpc_network.id
}

