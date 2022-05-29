#
# COMPUTE
#

locals {
  compute_group				= "${var.compute_group}"

  instances = flatten([
    for compute_group in local.compute_group: [
      for index in range(0, compute_group.count) : {
        name				= "${compute_group.name}${index+1}"
        machine_type			= "${compute_group.machine_type}"
        zone				= "${compute_group.zone}"
        image_id			= "${compute_group.image_id}"
        subnet				= "${compute_group.subnet}"
        disk_size			= "${compute_group.disk_size}"
      }
    ]
  ])
}

resource "google_compute_instance" "instance_" {
  for_each = {
    for x in local.instances : "${x.name}" => x
  }

  name					= each.value.name
  machine_type				= each.value.machine_type
  zone					= each.value.zone

  boot_disk {
    initialize_params {
      image				= each.value.image_id
      size				= each.value.disk_size
    }
  }

  network_interface {
    subnetwork				= "${each.value.subnet == "a" ? "${var.subnet_a}" : (each.value.subnet == "b" ? "${var.subnet_b}" : "${var.subnet_c}")}"
  }

  metadata_startup_script		= file("${path.module}/../files/compute-cloud-init.sh")

  labels = {
    team				= "${var.team}"
    environment				= "${var.environment}"
    state				= "${var.state}"
  }

  tags = [
    "worker",
    "ssh"
  ]
}
