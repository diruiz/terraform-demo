# do provider doc: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
# or an envriroment variable with TF_VAR_ prefix
variable "digitalocean_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.digitalocean_token
}
