provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_security_group" "security_groups" {
  description = "Allow 8080, SSH, icmp traffic - inbound"
  vpc_id = "${var.vpc_id}"

  # inbound rule - allow jenkins traffic
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # inbound rule - allow ssh traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # inbound rule - allow icmp/ping traffic
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound rule - allow all traffic 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "main" {
  ami = "${var.ami_id}"
  count = "${var.number_of_instances}"
  #security_groups = "${var.security_groups}"
  vpc_security_group_ids = [aws_security_group.security_groups.id]
  subnet_id = "${var.subnet_id}"
  instance_type = "${var.instance_type}"
  key_name =  "${var.ami_key_pair_name}"
  
  user_data = "${file("init.sh")}"

  tags = {
    Name = "${var.instance_name}"
    Team = "Developers"
  }

}

