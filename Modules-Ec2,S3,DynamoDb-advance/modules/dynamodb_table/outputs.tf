output "aws_dynamodb_table_name" {
    description = "Name of the dynamodb table"
    value = aws_dynamodb_table.aws_terraform_lock_dynamodb_table.name
}

