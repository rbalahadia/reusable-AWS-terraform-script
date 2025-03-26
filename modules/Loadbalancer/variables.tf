variable "standard_tags" {
  type = object({
    managed_by          = string
    warning_description = string
    BUDGET              = string
    PROJECT             = string
    BUSINESS            = string
    COST_CENTRE         = string
  })
  description = "List of standard tags for the ALB"
}
variable "tg_vpc_id" {
  type        = string
  description = "vpc id of the target"
}
variable "tg_port" {
  type        = string
  default     = "80"
  description = "Target group port"
}
variable "tg_target_type" {
  type        = string
  default     = "ip"
  description = "Target type of target group ip/instance etc."
}
variable "tg_protocol" {
  type        = string
  default     = "HTTP"
  description = "Target group protocol"
}
variable "load_balancer_type" {
  type        = string
  description = "Load balancer type eg. classic, application, network"
}
variable "subnet_ids_available" {
  type        = list(any)
  description = "Subnet IDs to be used by the load balancer"
}
variable "lb_security_groups" {
  type        = list(any)
  description = "Load balancer security group ids."
}
variable "enable_deletion" {
  type        = string
  default     = "false"
  description = "Deletion protection"
}
variable "ec2_instance_id" {
  type        = list(any)
  description = "List of instance IDs to attach in target group"
}

variable "ecom_listener_ssl_policy" {
  type        = string
  default     = null
  description = "SSL policy of port 443 or TLS."
}
variable "ecom_listener_certificate_arn" {
  type        = string
  default     = null
  description = "Certificate ARN"
}
variable "ecom_listener_action" {
  type        = string
  default     = "forward"
  description = "Load balancer action resource eg. forward, redirect"
}
variable "environment" {
  type        = string
  description = "acronym to designate the stage of the environment. E.g. dev, int, prd, ...)"
  default     = "dev"
}
variable "project_name" {
  type        = string
  description = "input project name"
  default     = "ecommerce"
}
