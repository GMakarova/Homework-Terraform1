provider aws {
    region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami                       = var.ami_id
  count                     = var.instance_count
  instance_type             = var.instance_type
  availability_zone         = var.availability_zone
  key_name                  = aws_key_pair.deployer.key_name
  vpc_security_group_ids    = [aws_security_group.allow_tls.id]

  tags = {
    Name = "web-${count.index + 1}"
  }
}

variable ami_id {
    description = "Provide AMI id"
    type = string
    default = ""
}

variable instance_type {
    description = "Provide instance type"
    type = string
    default = ""
}

variable count_ec2 {
    description = "Provide count ec2"
    type = number
    default = 1
}

variable region {
    description = "Provide region"
    type = string
    default = ""
}

variable availability_zone {
    description = "Provide availability zone"
    type = string
    default = ""
}

variable key_name {
    description = "Provide key name"
    type = string
    default = ""
}

variable ports {
  description = "List of ports to open"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "instance_count" {
  description = "Provide instances to create"
  type        = number
  default = 1
}