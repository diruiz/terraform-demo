# Virtual private clouds (VPC) A VPC is a virtual network that closely resembles a traditional network that you'd operate in your own data center
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = var.enable_dns_hostnames
}

resource "aws_subnet" "public_subnet" {  

  availability_zone       = var.aws_availability_zones
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.demo_vpc.id 
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "ec2-demo"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_rt_asso" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}