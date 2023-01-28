resource "digitalocean_droplet" "Terraform-08" {
  count = length(var.devs)
  image  = var.image
  name   = "Terraform-08-${count.index}"
  size   = var.size
  tags = [digitalocean_tag.name_of_course_tag.id, digitalocean_tag.name_of_task_tag.id, digitalocean_tag.email_tag.id]
  ssh_keys = [data.digitalocean_ssh_key.ssh_key_rebrain.id, digitalocean_ssh_key.personal_ssh_key.id]
   
  connection {
    type     = "ssh"
    user     = "root"
    host     = self.ipv4_address
    private_key = file(var.private_ssh_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'root:${random_string.pwgen[count.index].result}' | chpasswd",
    ]
 }
}

resource "digitalocean_tag" "name_of_course_tag" {
  name = var.name_of_course
}

resource "digitalocean_tag" "name_of_task_tag" {
  name = var.name_of_task
}

resource "digitalocean_tag" "email_tag" {
  name = var.email
}

resource "digitalocean_ssh_key" "personal_ssh_key" {
  name       = var.username
  public_key = file(var.public_ssh_key_path)
}

resource "aws_route53_record" "t" {
  count = length(var.devs)
  zone_id = data.aws_route53_zone.rebrain_zone.zone_id
  name    = "${var.devs[count.index]}"
  type    = "A"
  ttl     = 300
  records =[local.vps_ip_list[count.index]]
}

resource "random_string" "pwgen"{
  count = length(var.devs)
  length           = 20
  special          = true
}

resource "local_file" "infrasruture" {
  content  = templatefile("infrasruture.txt.tftpl", { 
    ip_addrs = digitalocean_droplet.Terraform-08[*].ipv4_address
    fqdn = aws_route53_record.t[*].fqdn
    pass = random_string.pwgen[*].result
    })
  filename = "${path.module}/infrasruture.txt"
}

