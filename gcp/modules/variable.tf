#
# PROJECT
#

variable "project" {
  type  = string
}

variable "vpc" {
  default = "vpc-network"
}

variable "region" {
  default = "us-central1"
}

variable "team" {
  default = "infrastructure"
}

variable "environment" {
  type = string
}

variable "state" {
  default = "active"
}

#
# CIDR
#

variable "subnet_1_cidr" {
  default = "10.10.0.0/24"
}

variable "subnet_2_cidr" {
  default = "10.20.0.0/24"
}

variable "subnet_3_cidr" {
  default = "10.30.0.0/24"
}

#
# REGION
#

variable "subnet_1_region" {                                                                                                                                                                 
  default = "us-central1"                                                                                                                                                                    
}                                                                                                                                                                                            
                                                                                                                                                                                             
variable "subnet_2_region" {                                                                                                                                                                 
  default = "us-central1"                                                                                                                                                                    
}                                                                                                                                                                                            
                                                                                                                                                                                             
variable "subnet_3_region" {
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
  default = "10.40.0.0/24"
}

#
# COMPUTE
#

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
