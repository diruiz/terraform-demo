terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# variables

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-west-2"
}

variable "cluster_name" {
  default = "terraform-eks-demo"
  type    = string
}

# Configure the AWS Provider
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region  
}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjunction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {}
