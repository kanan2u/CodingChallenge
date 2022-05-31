terraform {
  required_version = ">= 0.13"
}

provider "google" {
    credentials = file("delta-tuner-344409-3a0e74d1df45.json")
    region      = var.varregion
    zone        = var.varzone
}
