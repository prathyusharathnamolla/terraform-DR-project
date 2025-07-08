output "multi_region_dr_outputs" {
  value = {
    primary_instance_id       = aws_instance.primary_ec2.id
    secondary_instance_id     = aws_instance.secondary_ec2.id
    primary_vpc_id            = module.primary_vpc.vpc_id
    primary_public_subnet_id  = module.primary_vpc.public_subnet_id
    secondary_vpc_id          = module.secondary_vpc.vpc_id
    secondary_public_subnet_id = module.secondary_vpc.public_subnet_id
    primary_ec2_sg_id         = aws_security_group.primary_ec2_sg.id
    secondary_ec2_sg_id       = aws_security_group.secondary_ec2_sg.id
  }
}





/*output "primary_vpc_id" {
  value = module.primary_vpc.vpc_id
}

output "primary_public_subnet_id" {
  value = module.primary_vpc.public_subnet_id
}

output "primary_private_subnet_id" {
  value = module.primary_vpc.private_subnet_id
}

output "secondary_vpc_id" {
  value = module.secondary_vpc.vpc_id
}

output "secondary_public_subnet_id" {
  value = module.secondary_vpc.public_subnet_id
}

output "secondary_private_subnet_id" {
  value = module.secondary_vpc.private_subnet_id
}

output "primary_instance_id" {
  value = module.ec2.primary_instance_id
}

output "secondary_instance_id" {
  value = module.ec2.secondary_instance_id
}*/
