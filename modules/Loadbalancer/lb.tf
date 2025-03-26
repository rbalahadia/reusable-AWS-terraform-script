locals {
  created_date = formatdate("EEE, DD-MMM-YY hh-mmss ZZZ", timestamp())
}
#####ALB & Target groups#####
resource "aws_lb" "terraform_elb" {
  name                       = "${var.project_name}-${var.environment}-alb"
  load_balancer_type         = var.load_balancer_type
  subnets                    = var.subnet_ids_available
  security_groups            = var.lb_security_groups
  enable_deletion_protection = var.enable_deletion
  tags = merge(var.standard_tags, {
    Created_date = local.created_date
  })
}

resource "aws_lb_target_group" "terraform_tg" {
  name        = "${var.project_name}-${var.environment}-tg"
  target_type = var.tg_target_type
  vpc_id      = var.tg_vpc_id
  port        = var.tg_port
  protocol    = var.tg_protocol
  tags = merge(var.standard_tags, {
    Created_date = local.created_date
  })
}

resource "aws_lb_target_group_attachment" "terraform_tg_attach" {
  for_each = {
    for instance, v in var.ec2_instance_id :
    instance => v
  }
  target_group_arn = aws_lb_target_group.terraform_tg.arn
  target_id        = each.value
  port             = var.tg_port
}


#######Listeners block#########
resource "aws_lb_listener" "terraform_lb_listener" {
  load_balancer_arn = aws_lb.terraform_elb.arn
  port              = var.tg_port
  protocol          = var.tg_protocol
  ssl_policy        = var.ecom_listener_certificate_arn == null ? null : var.ecom_listener_ssl_policy
  certificate_arn   = var.ecom_listener_certificate_arn == null ? null : var.ecom_listener_certificate_arn
  default_action {
    type             = var.ecom_listener_action
    target_group_arn = aws_lb_target_group.terraform_tg.arn
  }
}
