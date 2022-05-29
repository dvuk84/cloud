#
# OUTPUTS
#

output "google_compute_network_vpc" {
  value = google_compute_network.vpc_network.id
}

output "google_subnetwork_a" {
  value = google_compute_subnetwork.subnet_a.name
}

output "google_subnetwork_b" {
  value = google_compute_subnetwork.subnet_b.name
}

output "google_subnetwork_c" {
  value = google_compute_subnetwork.subnet_c.name
}

output "google_subnetwork_jumphost" {
  value = google_compute_subnetwork.subnet_jumphost.name
}

