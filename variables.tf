variable "project_name" {
  type = string
}
variable "environment" {
  type = string
}
variable "vpc_cidr_blocks" {
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  default = true
}

variable "common_tags" {
  default = {}
}

variable "vpc_tags" {
  default = {}
}

variable "igw_tags" {
  default = {}
}

# variables declared for subnets
variable "public_subnet_cidr_blocks" {
  type = list(string)
  validation {
    condition = length(var.public_subnet_cidr_blocks) == 2
    error_message = "Please provide only 2 valid public subnet CIDR blocks"
  }
}
variable "private_subnet_cidr_blocks" {
  type = list(string)
   validation {
    condition = length(var.private_subnet_cidr_blocks) == 2
    error_message = "Please provide only 2 valid private subnet CIDR blocks"
  }
}
variable "database_subnet_cidr_blocks" {
  type = list(string)
   validation {
    condition = length(var.database_subnet_cidr_blocks) == 2
    error_message = "Please provide only 2 valid database subnet CIDR blocks"
  }
}
variable "public_subnet_tags" {
  default = {}
}
variable "private_subnet_tags" {
  default = {}
}
variable "database_subnet_tags" {
  default = {}
}
variable "database_subnet_group_tags" {
  default = {}
}

#variables for nat gatway
variable "nat_gateway_tags" {
  default = {}
}

#variables for route table
variable "public_route_table_tags" {
  default = {}
}
variable "private_route_table_tags" {
  default = {}
}
variable "database_route_table_tags" {
  default = {}
}

# peering variables
variable "is_peering_required" {
  type = bool
  default = false
}
variable "vpc_peering_tags" {
  default = {}
}