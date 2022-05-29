#
# OUTPUTS
#

output "bucket_terraform_state" {
  value = google_storage_bucket.bucket.name
}
