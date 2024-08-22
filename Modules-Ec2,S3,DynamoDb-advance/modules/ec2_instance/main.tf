resource "aws_security_group" "web-app-security-group" {
  name = var.ec2_security_group_name
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_22" {
  security_group_id = aws_security_group.web-app-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_80" {
  security_group_id = aws_security_group.web-app-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_all" {
  security_group_id = aws_security_group.web-app-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web-app-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_instance" "aws_ec2_instance" {
  ami = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  key_name = "tf-mum-temp-ntt"
  vpc_security_group_ids = [ aws_security_group.web-app-security-group.id ]

  tags = {
    Name = var.ec2_instance_name
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo yum update -y",
        "sudo yum install -y httpd",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "echo '<h1>Terraform is the Best...We have done it.!!</h1>' | sudo tee /var/www/html/index.html"
     ]

    connection {
        user = "ec2-user"
        host = self.public_ip
        private_key = file(var.ec2_private_key)
    }
  }
}

