data "publicip_address" "default" {
  source_ip = "0.0.0.0"
}

resource "google_compute_firewall" "ingress_public_ip" {
  name    = "ingress-public-ip"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges           = ["${data.publicip_address.default.ip}/32"]
  target_service_accounts = [google_service_account.k8s_sa.email]
}


resource "google_compute_firewall" "k8s_self" {
  name    = "k8s-self"
  network = google_compute_network.vpc.name

  allow {
    protocol = "all"
  }

  target_service_accounts = [google_service_account.k8s_sa.email]
  source_service_accounts = [google_service_account.k8s_sa.email]
}
