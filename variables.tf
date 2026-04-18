variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_name" {
  type    = string
  default = "jenkins-terraform-ec2"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type = string
}
