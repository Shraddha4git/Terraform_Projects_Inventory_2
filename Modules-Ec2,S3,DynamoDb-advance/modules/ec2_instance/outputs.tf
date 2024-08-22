output "aws_ec2_instance_public_ip" {
  description = "AWS EC2 instance public ip"
  value = aws_instance.aws_ec2_instance.public_ip
}

