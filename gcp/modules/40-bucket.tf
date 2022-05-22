#
# BUCKET
#

resource "random_id" "fspace" {
  byte_length           = 16
}

resource "google_storage_bucket" "bucket" {
  name                  = "fspace-${random_id.fspace.hex}"
  force_destroy         = true
  location              = "US"
  storage_class         = "STANDARD"

  versioning {
    enabled             = true
  }

  labels = {
    team                = "${var.team}"
    environment         = "${var.environment}"
    state               = "${var.state}"
  }
}
