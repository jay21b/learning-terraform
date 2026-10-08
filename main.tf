provider "aws" {
  region = "ap-south-1"
}

data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.ami.value
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Learning"
  }
}
