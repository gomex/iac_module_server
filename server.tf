provider "aws" {
  region = "us-east-1" # Substitua pela região da sua escolha
}

data "aws_ami" "custom_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["loki-*"]
  }

  filter {
    name   = "tag:OS_Version"
    values = ["Ubuntu"]
  }

  owners = ["405151343467"]
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.custom_ami.id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "exemplo-ec2"
  }
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}