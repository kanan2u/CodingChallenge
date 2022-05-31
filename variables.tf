variable "varregion" {
  # region in which the resources will be created
  type    = string
  default = "asia-south1" #""us-west4 (Las Vegas)" (Mumbai)
}

variable "varzone" {
  # zone in which the resources will be created
  type    = string
  default = "asia-south1-c" # "us-west4-b"
}

variable "varproject" {
  # name of the project
  type    = string
  default = "delta-tuner-344409"
}
