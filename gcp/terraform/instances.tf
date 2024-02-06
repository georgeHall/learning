data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2004-lts"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "master" {
  name         = "${var.prefix}-k8s-master"
  machine_type = "n2-standard-2"
  zone         = "${var.region}-a"

  tags = ["k8s", "master"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.id
      size  = 20
      labels = {
        my_label = "value"
      }
    }
  }

  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network    = google_compute_network.vpc.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link

    access_config {}
  }

  metadata = {
    ssh-keys = "${var.instance_user}:${file(var.ssh_pub_key_file_path)}"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    email  = google_service_account.k8s_sa.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance" "worker" {
  name         = "${var.prefix}-k8s-worker"
  machine_type = "n2-standard-2"
  zone         = "${var.region}-a"

  tags = ["k8s", "worker"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.id
      size  = 20
      labels = {
        my_label = "value"
      }
    }
  }

  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network    = google_compute_network.vpc.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link

    access_config {}
  }

  metadata = {
    ssh-keys = "${var.instance_user}:${file(var.ssh_pub_key_file_path)}"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    email  = google_service_account.k8s_sa.email
    scopes = ["cloud-platform"]
  }
}

output "ip" {
  value = tomap({
    "master" = google_compute_instance.master.network_interface.0.access_config.0.nat_ip,
    "worker" = google_compute_instance.worker.network_interface.0.access_config.0.nat_ip,
  })
}
output "ssh" {
  value = tomap({
    "master" = "ssh ${var.instance_user}@${google_compute_instance.master.network_interface.0.access_config.0.nat_ip}",
    "worker" = "ssh ${var.instance_user}@${google_compute_instance.worker.network_interface.0.access_config.0.nat_ip}",
  })
}
