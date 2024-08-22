#Main Files Variables

variable "aws_region" {
  description = "aws region"
  type = string
}

# EC2 Instance Module Variables

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

variable "vpc_id" {
  description = "VPC Id"
  type = string
}

variable "ec2_security_group_name" {
  description = "Name of the Security group for EC2"
  type = string
}

variable "ec2_private_key" {
  description = "Path for the EC2 pem file"
  type = string
}

# S3 Module Variables

variable "s3_bucket_name" {
  description = "Name of the s3 bucket"
  type = string
}


# Dynamodb Module Variables

variable "aws_dynamodb_table_name" {
    description = "Name of the dynamodb table"
    type = string
}

