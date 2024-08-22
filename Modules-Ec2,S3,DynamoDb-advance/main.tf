# Define Locals for using dynamic variables with the variable terraform.workspace ( dev/prod )
locals {
  ec2_instance_name         = "${terraform.workspace}-${var.ec2_instance_name}"
  # s3_bucket_name            = "${terraform.workspace}-${var.s3_bucket_name}"
  # aws_dynamodb_table_name   = "${terraform.workspace}-${var.aws_dynamodb_table_name}"
  ec2_security_group_name   = "${terraform.workspace}-${var.ec2_security_group_name}"
}

# Defining module for EC2 module
module "ec2_instance_module" {
  source = "./modules/ec2-instance"
  ec2_ami_id = var.ec2_ami_id
  ec2_instance_name = local.ec2_instance_name
  ec2_instance_type = var.ec2_instance_type
  ec2_private_key = var.ec2_private_key
  vpc_id = var.vpc_id
  ec2_security_group_name = local.ec2_security_group_name
}

# Defining module for S3 Bucket
module "s3_bucket_module" {
  source = "./modules/s3-bucket"
  s3_bucket_name = var.s3_bucket_name
}

# Deniging module for DynamoDB
module "dynamodb_table_terraform_lock_module" {
  source = "./modules/dynamo-db"
  aws_dynamodb_table_name = var.aws_dynamodb_table_name
}

