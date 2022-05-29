#
# JUMPHOST
#

resource "google_compute_address" "jumphost_static_ip" {
  name				= "ipv4-address"
}

resource "google_compute_instance" "jumphost" {
  name				= "jumphost"
  machine_type			= "${var.jumphost_machine_type}"
  zone				= "${var.jumphost_zone}"

  boot_disk {
    initialize_params {
      image			= "${var.jumphost_image_id}"
    }
  }

  network_interface {
    subnetwork			= "${var.subnet_jumphost}"

    access_config {
      network_tier		= "STANDARD"
      nat_ip			= google_compute_address.jumphost_static_ip.address
    }
  }

  metadata_startup_script	= file("${path.module}/../files/jumphost-cloud-init.sh")

  labels = {
    team			= "${var.team}"
    environment			= "${var.environment}"
    state			= "${var.state}"
  }

  tags = [
    "jumphost",
    "ssh"
  ]
}
