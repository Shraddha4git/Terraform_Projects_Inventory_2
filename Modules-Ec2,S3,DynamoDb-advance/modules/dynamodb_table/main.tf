resource "aws_dynamodb_table" "aws_terraform_lock_dynamodb_table" {
  name = var.aws_dynamodb_table_name
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "Dev-Table"
  }
}

