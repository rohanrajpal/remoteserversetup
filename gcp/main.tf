terraform {
  required_providers {
    google = {
      source = "hashicorp/google-beta"
    }
  }
}

provider "google" {
  credentials = file("cowinalerts.json")
  project     = "cowinalerts"
  region      = "asia-south1"
  zone        = "asia-south1-c"
}


resource "google_compute_instance_from_machine_image" "tpl" {
  count = var.instance_count

  name                 = "terraform-instance-${count.index + 1}"
  source_machine_image = "proxy-image"
  machine_type         = "e2-micro"
  # zone                 = var.instance_count % 2 == 0 ? "asia-south1-b" : "asia-south1-b"

  # tags = {
  #   Name = "ProxyServer-${count.index + 1}"
  # }
}

# resource "aws_eip" "lb" {
#   count    = var.instance_count
#   instance = aws_instance.app_server[count.index].id
#   vpc      = true
#   tags = {
#     "Name" = "ElasticIP-${count.index + 1}"
#   }
# }
