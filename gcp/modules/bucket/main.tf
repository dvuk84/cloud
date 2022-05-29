#
# OUTPUT
#

resource "random_id" "bsirius" {
  byte_length			= 8
}

resource "google_storage_bucket" "bucket" {
  name				= "bsirius-${random_id.bsirius.hex}"
  force_destroy			= true
  location			= "US"
  storage_class			= "STANDARD"

  versioning {
    enabled			= true
  }

  labels = {
    team			= "${var.team}"
    environment			= "${var.environment}"
    state			= "${var.state}"
  }
}
