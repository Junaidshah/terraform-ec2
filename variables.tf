
# General
######################################

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "owner" {
  description = "Configuration owner"
  type        = string
}

variable "aws_region_az" {
  description = "AWS region availability zone"
  type        = string
  default     = "a"
}


# VPC
######################################

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "vpc_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}


# Variables for Security Group
######################################

variable "sg_ingress_protocol" {
  description = "Protocol used for the ingress rule"
  type        = string
  default     = "tcp"
}

variable "sg_ingress_ssh" {
  description = "Port used for ssh ingress"
  type        = string
  default     = "22"
}

variable "sg_ingress_http" {
  description = "Port used for http ingress"
  type        = string
  default     = "80"
}

variable "sg_egress_proto" {
  description = "Protocol used for the egress rule"
  type        = string
  default     = "-1"
}

variable "sg_egress_all" {
  description = "Port used for the egress rule"
  type        = string
  default     = "0"
}

variable "sg_egress_cidr_block" {
  description = "CIDR block for the egress rule"
  type        = string
  default     = "0.0.0.0/0"
}


# Subnet
######################################

variable "subnet_public_ip" {
  description = "Assign public IP to the instance launched into the subnet"
  type        = bool
  default     = true
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}


# Route Table
######################################

variable "rt_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}


# Instance
######################################

variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-0b1deee75235aa4bb"
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.medium"
}

variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
}

variable "root_device_type" {
  description = "Type of the root block device"
  type        = string
  default     = "gp2"
}

variable "root_device_size" {
  description = "Size of the root block device"
  type        = string
  default     = "50"
}
