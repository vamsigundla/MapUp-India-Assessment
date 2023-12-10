# main.tf

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "example-vpc"
  }
}

# Create Subnets
resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_blocks[0]
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_blocks[1]
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-b"
  }
}
# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
 vpc_id                  = aws_vpc.main.id

  tags = {
    Name = "my-igw"
  }
}

# Create Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 Instance
resource "aws_instance" "example_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet_a.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = var.instance_name
  }
}

# Create Application Load Balancer
resource "aws_lb" "example_alb" {
  name               = "${var.alb_name}-${var.aws_account_id}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ec2_sg.id]
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

  enable_deletion_protection = false

  enable_cross_zone_load_balancing = true

  enable_http2 = true
}

# Create Target Group
resource "aws_lb_target_group" "example_target_group" {
  name        = "example-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"
}

# Register Target with Target Group
resource "aws_lb_target_group_attachment" "example_target_attachment" {
  target_group_arn = aws_lb_target_group.example_target_group.arn
  target_id        = aws_instance.example_instance.id
  port             = 80
}
# Create ALB Listeners
resource "aws_lb_listener" "my_listener_http" {
  load_balancer_arn = aws_lb.example_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      message_body = "OK"
    }
  }
}
