output "droplet_ip" {
  value       = digitalocean_droplet.Terraform-08[*].ipv4_address
  description = "ssh ip"
}

output "DNS_reords" {
  value       = aws_route53_record.t[*].fqdn
  description = "DNS records "
}

output "random_string" {
  value       = [for i in random_string.pwgen[*].result : i]
  description = "passwords"
}


