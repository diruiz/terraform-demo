#
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services (Identity and Access Management)
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#

resource "aws_security_group" "ec2-sg" {
  name        = "terraform-ec2-demo"
  description = "Allow ssh http inbound traffic"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "terraform-ec2-demo"
  }
}

# Get latest Amazon Windows Server 2019 Ami
data "aws_ami" "windows-2019" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base*"]
  }
}

# Create the Linux EC2 Web server
resource "aws_instance" "web" {
  ami             = data.aws_ami.windows-2019.id
  instance_type   = "t3.micro"
  key_name        = "MyKeyPair"
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.ec2-sg]

  user_data       = file("./scripts/userdata.tpl")
}