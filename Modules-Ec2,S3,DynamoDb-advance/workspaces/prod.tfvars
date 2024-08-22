# Main Variables

aws_region = "ap-south-1"

# EC2 Module Instance Variables

ec2_ami_id = "ami-02b49a24cfb95941c"
ec2_instance_type = "t2.micro"
ec2_instance_name = "tf-Terraform-Web-App"
ec2_private_key = "./private-keys/mum-temp.rsa"
vpc_id = "vpc-060d00a1b02532e99"
ec2_security_group_name = "Web-App-Security-Group"

# S3 Module Variables

s3_bucket_name = "web-terraform-backend-bucket"

# Dynamodb Module Variables

aws_dynamodb_table_name = "web-terraform-lock-table"

