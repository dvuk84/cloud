#
# DEFAULT PROJECT
#

project				= ""
vpc				= "vpc-network-1-testing"
region				= "us-central1"
team				= "infrastructure"
environment			= "testing"
state				= "active"
jumphost_in			= [""]
credentials_file		= ""

compute_group = {
  # GROUP A
  "compute_group_a" = {
    count			= 1,
    name			= "instance-a-",
    machine_type		= "f1-micro",
    zone			= "us-central1-a",
    image_id			= "centos-7-v20220519",
    subnet			= "a",
    disk_size			= 20,
  },
  # GROUP B
  "compute_group_b" = {
    count                       = 1,
    name                        = "instance-b-",
    machine_type                = "f1-micro",
    zone                        = "us-central1-b",
    image_id                    = "centos-7-v20220519",
    subnet                      = "b",
    disk_size                   = 20,
  },
  # GROUP C
  "compute_group_c" = {
    count                       = 1,
    name                        = "instance-c-",
    machine_type                = "f1-micro",
    zone                        = "us-central1-c",
    image_id                    = "centos-7-v20220519",
    subnet                      = "c",
    disk_size                   = 20,
  },
}
