#ac2-1 -serverApp
#sc2-2 -for_connectRDS



provider "aws" {
  region = "eu-central-1"
}
#ac2-1 -serverApp
resource "aws_instance" "server_app" {
  ami                    = "ami-058e6df85cfc7760b" #Amazon linux
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.My_webserver.id]
}

#sc2-2 -for_connectRDS
resource "aws_instance" "server_conectRDS" {
  ami           = "ami-058e6df85cfc7760b" #Amazon linux
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.My_webserver.id]
}


resource "aws_security_group" "My_webserver" {
  name        = "Webserver Security Group"
  description = "My first SecurityGroup"
  ingress {
    #  description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    #  description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
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
    Name = "allow_tls"
  }
}
