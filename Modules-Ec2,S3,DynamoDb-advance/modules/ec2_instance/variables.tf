variable "ec2_ami_id" {
  description = "AMI Id for EC2 instance"
  type = string
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instance"
  type = string
}

variable "ec2_instance_name" {
  description = "Name of the EC2 instance"
  type = string
}

variable "ec2_private_key" {
  description = "EC2 Private Key Path"
  type = string
}

variable "ec2_security_group_name" {
  description = "Name of the Security group for EC2"
  type = string
}

variable "vpc_id" {
  description = "VPC Id"
  type = string
}

