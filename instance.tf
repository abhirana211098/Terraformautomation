provider "aws" {
  region  = "ap-south-1"
  access_key="access_key"
  secret_key="secret_key"
}

resource "aws_instance" "terraform" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
  vpc_security_group_ids=["${aws_security_group.aws_secure.id}"]
  tags = {
    Name = "Terraform_Instance"
  }
  }


variable "sample"{
  type=string
  default="vpc-0047044866d0ec465"
}

resource "aws_security_group" "aws_secure" {
  name        = "aws_security"
  description = "i am secure group member"
  vpc_id      = "${var.sample}"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 9997
    to_port          = 9997
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 8000
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 8088
    to_port          = 8088
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 8085
    to_port          = 8085
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   
  }
  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "allow_tls"
  }
}
