# https://developer.hashicorp.com/terraform/language/values/variables

variable "access_key" {
  description = "Access key to AWS console"
}
variable "secret_key" {
    description = "Secret key to AWS console"
}

variable "region" {
    description = "The region EC2 instances will be created in"
    default = "us-east-1"
}
variable "instance_name" {
    description = "Name of the instance to be created"
    default = "proj-ec2"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "vpc_id" {
    default = "vpc-094935408df5c4b0b"
}

variable "subnet_id" {
    description = "The VPC subnet the instance(s) will use -> us-east-1a"
    default = "subnet-0f15680deb5806193"   
}

variable "ami_id" {
    description = "the AMI image to use -> ubuntu 20 lts 64 bit"
    default = "ami-0261755bbcb8c4a84"
}

variable "number_of_instances" {
  description = "the number of instances to create"
  default = 1
}

variable "ami_key_pair_name" {
    description = "The key pair(.pem file) the ec2 instance is going to use"
    default = "key"  # warning/error note: DO NOT use .pem/extension
}

