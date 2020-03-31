output "primary_cluster" {
  value = google_service_account.primary_cluster

  description = "The service account to be associated with the primary cluster."
}

output "internal_load_balancer" {
  value = google_service_account.internal_load_balancer

  description = "The service account to be associated with the internal load balancer."
}

output "secondary_cluster" {
  value = google_service_account.secondary_cluster

  description = "The service account to be associated with the secondary cluster."
}

output "storage" {
  value = google_service_account.storage

  description = "The service account which will be used to access the storage bucket."
}

output "storage_key" {
  value = google_service_account_key.storage

  description = "The key which will be used to authenticate as the storage service account."
}
