provider "aws" {
  region = "eu-north-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "my_app_server" {
  ami           = "ami-0705384c0b33c194c"
  instance_type = "t3.micro"
  key_name      = "sre"
  security_groups = ["default"]

  tags = {
    Name = "SREFINAL"
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.my_app_server.public_ip
}
