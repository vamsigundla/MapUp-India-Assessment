# variables.tf

variable "aws_region" {
  description = "AWS region where resources will be created"
  default     = "us-east-1"
}

variable "aws_account_id" {
  description = "305145293208"
}

variable "aws_access_key" {
  description = "AKIAUODATVGMN7OILX27"
}

variable "aws_secret_key" {
  description = "6+DSmwK9ss47IeaYdr1jF3aeaxKbVSCI+fVB1DFA"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "ami" {
  description = "Amazon Machine Image ID for the EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "alb_name" {
  description = "Name for the Application Load Balancer"
  default     = "example-alb"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  default     = "example-instance"
}
