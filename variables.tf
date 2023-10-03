variable "region" {
  description = "AWS region"
  default = "ap-south-1"
}

variable "ami_id" {
  description = "AMI for ubuntu instance"
  type        = string
  default     = "ami-0f5ee92e2d63afc18"  #Ubuntu AMI for "ap-south-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default = "Hybrid Test"
}

variable "SecGrp_name" {
  description = "EC2 Secutity Group name"
  default = "Hybrid Test SG"
}
