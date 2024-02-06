resource "google_service_account" "k8s_sa" {
  account_id   = "k8s-sa"
  display_name = "Service Account for k8s nodes."
}

output "service_account" {
  value = google_service_account.k8s_sa
}
