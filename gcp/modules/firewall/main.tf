#
# FIREWALL
#

resource "google_compute_firewall" "internal_inbound" {
  name				= "internal-inbound"
  network			= "${var.vpc_id}"

  allow {
    protocol			= "icmp"
  }

  allow {
    protocol			= "tcp"
    ports			= ["0-65535"]
  }

  allow {
    protocol			= "udp"
    ports			= ["0-65535"]
  }

  source_ranges = [
    "${var.subnet_a_cidr}",
    "${var.subnet_b_cidr}",
    "${var.subnet_c_cidr}",
    "${var.subnet_jumphost}"
  ]
}

resource "google_compute_firewall" "jumphost_inbound" {
  name				= "jumphost-inbound"
  network			= "${var.vpc_id}"
  direction			= "INGRESS"

  allow {
    protocol			= "tcp"
    ports			= ["22"]
  }

  source_ranges			= "${var.jumphost_in}"

  target_tags = [
    "jumphost"
  ]
}
