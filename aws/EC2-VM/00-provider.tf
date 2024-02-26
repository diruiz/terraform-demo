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

variable "ec2_name" {
  default = "terraform-ec2-demo"
  type    = string
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

# Configure the AWS Provider
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region  
}

variable "aws_availability_zones" {
  type        = string
  description = "AWS Availability Zones"
  default = "us-west-2a"
}

# Not required: currently used in conjunction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {}
