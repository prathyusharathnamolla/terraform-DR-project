resource "aws_security_group" "primary_ec2_sg" {
  provider    = aws.primary
  name        = "primary-ec2-sg"
  description = "Allow SSH and HTTP"
  vpc_id = module.primary_vpc.vpc_id


  ingress {
    description = "Allow SSH within VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.primary_vpc_cidr]
  }

  ingress {
    description = "Allow HTTP from all"
    from_port   = 80
    to_port     = 80
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
    Name = "primary-ec2-sg"
  }
}

resource "aws_security_group" "secondary_ec2_sg" {
  provider    = aws.secondary
  name        = "secondary-ec2-sg"
  description = "Allow SSH and HTTP"
  vpc_id      =  module.secondary_vpc.vpc_id

  ingress {
    description = "Allow SSH within VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.secondary_vpc_cidr]
  }

  ingress {
    description = "Allow HTTP from all"
    from_port   = 80
    to_port     = 80
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
    Name = "secondary-ec2-sg"
  }
}