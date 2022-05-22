#
# COMPUTE
#

resource "google_compute_instance" "instance_a_" {
  count				= "${var.compute_a_count}"
  name				= "instance-${count.index+1}"
  machine_type			= "${var.compute_a_machine_type}"
  zone				= "${var.compute_a_zone}"

  boot_disk {
    initialize_params {
      image			= "${var.compute_a_image_id}"
    }
  }

  network_interface {
    subnetwork			= google_compute_subnetwork.subnet_1.id
  }

  labels = {
    team                = "${var.team}"
    environment         = "${var.environment}"
    state               = "${var.state}"
  }

  tags = [
    "worker",
    "ssh"
  ]
}

resource "google_compute_instance" "instance_b_" {
  count                         = "${var.compute_b_count}"
  name                          = "instance-${count.index+1}"
  machine_type                  = "${var.compute_b_machine_type}"
  zone                          = "${var.compute_b_zone}"

  boot_disk {
    initialize_params {
      image                     = "${var.compute_b_image_id}"
    }
  }

  network_interface {
    subnetwork                  = google_compute_subnetwork.subnet_2.id
  }

  labels = {
    team                = "${var.team}"
    environment         = "${var.environment}"
    state               = "${var.state}"
  }

  tags = [
    "worker",
    "ssh"
  ]
}

resource "google_compute_instance" "instance_c_" {
  count                         = "${var.compute_c_count}"
  name                          = "instance-${count.index+1}"
  machine_type                  = "${var.compute_c_machine_type}"
  zone                          = "${var.compute_c_zone}"

  boot_disk {
    initialize_params {
      image                     = "${var.compute_c_image_id}"
    }
  }

  network_interface {
    subnetwork                  = google_compute_subnetwork.subnet_3.id
  }

  labels = {
    team                = "${var.team}"
    environment         = "${var.environment}"
    state               = "${var.state}"
  }

  tags = [
    "worker",
    "ssh"
  ]
}
