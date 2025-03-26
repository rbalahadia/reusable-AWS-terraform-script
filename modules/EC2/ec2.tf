locals {
  created_date = formatdate("EEE, DD-MMM-YY hh-mmss ZZZ", timestamp())
}
#####EC2 INSTANCE#####
resource "aws_instance" "ecommerce_ec2" {
  associate_public_ip_address = var.ec2_associate_public_ip_address
  count                       = var.ec2_instance_count
  instance_type               = var.ec2_instance_type
  ami                         = var.ec2_instance_image
  user_data                   = var.ec2_userdata
  iam_instance_profile        = aws_iam_instance_profile.ecommerce_ec2_profile.name
  security_groups             = var.ec2_security_groups
  monitoring                  = var.ec2_monitoring
  ebs_optimized               = var.ec2_ebs_optimized
  subnet_id                   = var.subnet_ids_available[count.index]
  tags = merge(var.standard_tags, {
    Name         = "${var.project_name}-${var.environment}-${count.index}"
    Created_date = local.created_date
  })
}

resource "aws_iam_instance_profile" "ecommerce_ec2_profile" {
  name = "${var.project_name}-${var.environment}-profile"
  role = var.ec2_instance_profile
}
