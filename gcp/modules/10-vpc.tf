#
# VPC
#

resource "google_compute_network" "vpc_network" {
  project                 	= "${var.project}"
  name                    	= "${var.vpc}"
  auto_create_subnetworks 	= false
  routing_mode			= "REGIONAL"
}

resource "google_compute_subnetwork" "subnet_1" {
  name				= "subnet-1"
  ip_cidr_range			= "${var.subnet_1_cidr}"
  region			= "${var.subnet_1_region}"
  network			= google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_2" {
  name                          = "subnet-2"
  ip_cidr_range                 = "${var.subnet_2_cidr}"
  region                        = "${var.subnet_2_region}"
  network                       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_3" {
  name                          = "subnet-3"
  ip_cidr_range                 = "${var.subnet_3_cidr}"
  region                        = "${var.subnet_3_region}"
  network                       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet_jumphost" {
  name                          = "subnet-jumphost"
  ip_cidr_range                 = "${var.subnet_jumphost_cidr}"
  region                        = "${var.subnet_jumphost_region}"
  network                       = google_compute_network.vpc_network.id
}

#
# FIREWALL
#

resource "google_compute_firewall" "internal_inbound" {
  name                          = "internal-inbound"
  network                       = google_compute_network.vpc_network.id

  allow {
    protocol                    = "icmp"
  }

  allow {
    protocol                    = "tcp"
    ports                       = ["0-65535"]
  }

  allow {
    protocol                    = "udp"
    ports                       = ["0-65535"]
  }

  source_ranges = [
    "${var.subnet_1_cidr}",
    "${var.subnet_2_cidr}",
    "${var.subnet_3_cidr}",
    "${var.subnet_jumphost_cidr}"
  ]
}

resource "google_compute_firewall" "jumphost_inbound" {
  name                          = "jumphost-inbound"
  network                       = google_compute_network.vpc_network.id
  direction			= "INGRESS"

  allow {
    protocol                    = "tcp"
    ports                       = ["22"]
  }

  source_ranges = [
    "0.0.0.0/0"
  ]

  target_tags = [
    "jumphost"
  ]
}
