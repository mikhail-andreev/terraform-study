locals {
  vps_ip_list = digitalocean_droplet.Terraform-08[*].ipv4_address
  }



