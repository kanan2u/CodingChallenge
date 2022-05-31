resource "google_compute_instance" "defaultweb" {
  name         = "web-server"
  machine_type = "e2-micro"
  zone         = var.varzone
  project = var.varproject

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name
  #  network = "default"
    access_config {
      // Ephemeral IP
    }
  }
  tags = ["web-server"]
  }

#firewal rules for prublic subnet resources
resource "google_compute_firewall" "publicsubnetrules"{
  project   =   var.varproject
  name      =   "webserver-firewall"
  network   =   google_compute_subnetwork.public_subnet.name

  allow{
    protocol = "tcp"
    ports    =["80"]
  }

  source_ranges=["0.0.0.0/0"] //
  target_tags=["web-server"]
}
