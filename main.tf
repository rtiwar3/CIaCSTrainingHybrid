locals {
  vpc_id              = "vpc-04de07d7d900e861b"
  subnet_id           = "subnet-03f860555a8ea4854"
  keyname             = "CIaCTS_key"
  #my_access_key       = ""
  #my_secret_key       = ""
}

provider "aws" {
  region = var.region
  #access_key = local.my_access_key
  #secret_key = local.my_secret_key
}

resource "aws_security_group" "hybrid-sg" {
  name = var.secgrp_name
  description = var.secgrp_name
  vpc_id = local.vpc_id

  // To Allow SSH Transport
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_instance" "hybrid" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = local.subnet_id 
  associate_public_ip_address = true
  key_name = local.keyname

  user_data = "${file("init-script.sh")}"
    
  vpc_security_group_ids = [
    aws_security_group.hybrid-sg.id
  ]

  tags = {
    Name = var.instance_name
  }

  depends_on = [ aws_security_group.hybrid-sg ]
}
