#
# PASS-ON VARS
#

variable "vpc_id" {
  default = ""
}

variable "subnet_a" {
  default = ""
}

variable "subnet_b" {
  default = ""
}

variable "subnet_c" {
  default = ""
}

variable "credentials_file" {
  default = ""
}

#
# PROJECT
#

variable "project" {
  default = "testing-project"
}

variable "vpc" {
  default = "vpc-network-1"
}

variable "region" {
  default = "us-central1"
}

variable "team" {
  default = "infrastructure"
}

variable "environment" {
  default = "production"
}

variable "state" {
  default = "active"
}

#
# CIDR
#

variable "subnet_a_cidr" {
  default = "10.10.0.0/24"
}

variable "subnet_b_cidr" {
  default = "10.20.0.0/24"
}

variable "subnet_c_cidr" {
  default = "10.30.0.0/24"
}

variable "subnet_jumphost" {
  default = "10.100.0.0/24"
}

#
# REGION
#

variable "subnet_a_region" {
  default = "us-central1"
}

variable "subnet_b_region" {
  default = "us-central1"
}

variable "subnet_c_region" {
  default = "us-central1"
}

variable "subnet_jumphost_region" {
  default = "us-central1"
}


#
# JUMPHOST
#

variable "jumphost_machine_type" {
  default = "f1-micro"
}

variable "jumphost_zone" {
  default = "us-central1-a"
}

variable "jumphost_image_id" {
  default = "centos-7-v20220519"
}

variable "subnet_jumphost_cidr" {
  default = "10.100.0.0/24"
}

#
# COMPUTE
#

variable "compute_group" {
  type = map(any)
  default = {}
}

variable "compute_group_a" {
  type = map(any)
  default = {}
}

variable "compute_group_b" {
  type = map(any)
  default = {}
}
variable "compute_group_c" {
  type = map(any)
  default = {}
}

variable "compute_a_machine_type" {
  default = "f1-micro"
}

variable "compute_b_machine_type" {
  default = "f1-micro"
}

variable "compute_c_machine_type" {
  default = "f1-micro"
}

variable "compute_a_zone" {
  default = "us-central1-a"
}

variable "compute_b_zone" {
  default = "us-central1-b"
}

variable "compute_c_zone" {
  default = "us-central1-c"
}

variable "compute_a_image_id" {
  default = "centos-7-v20220519"
}

variable "compute_b_image_id" {
  default = "centos-7-v20220519"
}

variable "compute_c_image_id" {
  default = "centos-7-v20220519"
}

variable "compute_a_count" {
  default = 1
}

variable "compute_b_count" {
  default = 1
}

variable "compute_c_count" {
  default = 1
}

#
# REMOTE ENV
#

variable "ssh_user" {
  default = "user"
}

#
# FIREWALL
#

variable "jumphost_in" {
  type = list
  default = ["127.0.0.1"]
}
