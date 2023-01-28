variable "do_token" {
  description = "DO token"
  type = string
}

variable "public_ssh_key_path" {
  description = "public ssh key path"
  type = string
}

variable "private_ssh_key_path" {
  description = "private ssh key path"
  type = string
}

variable "image" {
  description = "OS image"
  type = string
}

variable "name" {
  description = "name of droplet"
  type = string
}

variable "size" {
  description = "size of droplet"
  type = string
}

variable "name_of_course" {
  description = "name of course"
  type = string
}

variable "name_of_task" {
  description = "name of task"
  type = string
}

variable "email" {
  description = "email"
  type = string
}

variable "username" {
  description = "username for ssh key"
  type = string
}

variable "rebrain_ssh_key_name" {
  description = "rebarain ssh key name"
  type = string
}

variable "DNS_record_zone" {
  description = "DNS record name"
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "devs" {
 type    = list 
}