provider aws {
    region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = "galina-hw6"
  public_key = file("~/.ssh/id_rsa.pub")
}

variable region {
    type = string
    description = "Provide region"
}

variable instance_type {
    type = string
    description = "Provide instance type"
}

variable port {
    type = list(number)
    default = [22, 80, 443]
}