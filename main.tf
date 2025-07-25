resource "aws_security_group" "srinidhi_sg" {
  name        = "srinidhi-sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = null # If using default VPC, leave null

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Srinidhi-SG"
    environment = "Development"
    owner       = var.student_id
  }
}

resource "aws_instance" "srinidhi_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.srinidhi_sg.id]

  tags = {
    Name        = "Srinidhi-Terraform-Instance"
    environment = "Development"
    owner       = var.student_id
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}


