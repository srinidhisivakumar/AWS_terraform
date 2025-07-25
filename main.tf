resource "aws_instance" "srinidhi_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "Srinidhi-Terraform-Instance"
    environment = "Development"
    owner       = var.student_id
  }
}
