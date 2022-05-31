# app server compute instance
resource "google_compute_instance" "defaultapp" {
  name         = "app-server"
  machine_type = "e2-micro"
  zone         = var.varzone
  project = var.varproject

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.name
  //  access_config {
      // Ephemeral IP
    //}
  }
  tags = ["app-server"]
  }
# db server compute instance
  resource "google_compute_instance" "defaultdb" {
    name         = "db-server"
    machine_type = "e2-micro"
    zone         = var.varzone
    project = var.varproject

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-10"
      }
    }

    network_interface {
      subnetwork = google_compute_subnetwork.private_subnet.name
    //  access_config {
        // Ephemeral IP
      //}
    }
    tags = ["db-server"]
    }

#firewal rules for prublic subnet resources
resource "google_compute_firewall" "privatesubnetrules"{
  project   =   var.varproject
  name      =   "app-db-server-firewall"
  network   =   google_compute_subnetwork.private_subnet.name

  allow{
    protocol = "tcp"
    ports    =["8080"]
  }

  source_ranges=["0.0.0.0/0"] //
  target_tags=["app-server", "db-server"]
}
