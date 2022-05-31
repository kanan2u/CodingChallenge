# create the VPC
resource "google_compute_network" "vpc_network" {
 name = "main-vpc-network"
 auto_create_subnetworks = false
 project = var.varproject
}

# create the public subnet
resource "google_compute_subnetwork" "public_subnet" {
name = "public-subnetwork"
ip_cidr_range = "10.2.1.0/24"
region = var.varregion
network = google_compute_network.vpc_network.name
project = var.varproject
}

# create the private subnet
resource "google_compute_subnetwork" "private_subnet" {
name = "private-subnetwork"
ip_cidr_range = "10.2.2.0/24"
region = var.varregion
network = google_compute_network.vpc_network.name
private_ip_google_access = true
project = var.varproject
}
