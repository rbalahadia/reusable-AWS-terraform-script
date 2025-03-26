output "ecommerce_ec2_ip" {
  value = aws_instance.ecommerce_ec2[*].private_ip
}

output "ecommerce_ec2_id" {
  value = aws_instance.ecommerce_ec2[*].id
}
output "ecommerce_ec2_arn" {
  value = aws_instance.ecommerce_ec2[*].arn
}

