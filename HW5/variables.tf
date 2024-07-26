variable "region" {
  default                          = "us-west-2"
}

locals {
  azs                              = ["${var.region}a", "${var.region}b", "${var.region}c", "${var.region}d"]
}

variable "route_table_names" {
  default = {
    public                          = "public-rt"
    private                         = "private-rt"
  }
}

variable "internet_gateway_name" {
  default                           = "hw5_igw"
}

variable "vpc_settings" {
  default = {
    cidr                            = "192.168.0.0/16"
    dns_support                     = true
    dns_hostnames                   = true
  }
}

variable "subnets" {
  default = [
    { cidr = "192.168.1.0/24", name = "pb1" },
    { cidr = "192.168.2.0/24", name = "pb2" },
    { cidr = "192.168.101.0/24", name = "pr1" },
    { cidr = "192.168.102.0/24", name = "pr2" }
  ]
}

variable "ec2_instances" {
  default = [
    { type                          = "t2.micro", name = "Ubuntu"},
    { type                          = "t2.micro", name = "Amazon"}
  ]
}

variable "ports" {
  default = [22, 80]
}