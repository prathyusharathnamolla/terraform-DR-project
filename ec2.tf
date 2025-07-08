resource "aws_instance" "primary_ec2" {
  provider                    = aws.primary
  ami                         = var.primary_ami
  instance_type               = var.instance_type
  subnet_id                  =module.primary_vpc.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.primary_ec2_sg.id]

  tags = {
    Name = "primary-ec2-instance"
  }
}

resource "aws_instance" "secondary_ec2" {
  provider                    = aws.secondary
  ami                         = var.secondary_ami
  instance_type               = var.instance_type
  subnet_id                   = module.secondary_vpc.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.secondary_ec2_sg.id]

  tags = {
    Name = "secondary-ec2-instance"
  }
}
