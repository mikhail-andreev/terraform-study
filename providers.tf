terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"      
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    } 
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}