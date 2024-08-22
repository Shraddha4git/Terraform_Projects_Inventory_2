terraform {
  backend "s3" {
    bucket         = "web-terraform-backend-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "web-terraform-lock-table"
  }
}

