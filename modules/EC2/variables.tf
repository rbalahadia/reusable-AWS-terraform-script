
#####EC2#####
variable "ec2_instance_image" {
  type        = string
  description = "Instance image id. eg. ami-xxxx"
  default     = "ami-00385a401487aefa4"
}

variable "ec2_instance_type" {
  type        = string
  default     = "t3.medium"
  description = "EC2 Instance type"
}
variable "ec2_instance_count" {
  type        = number
  default     = 1
  description = "number of EC2 instance to create"
}
variable "ec2_userdata" {
  type        = string
  default     = ""
  description = "Userdata for EC2"
}
variable "ec2_instance_profile" {
  type        = string
  default     = "ecommerce"
  description = "IAM instance profile for the new EC2"
}
variable "ec2_associate_public_ip_address" {
  type        = bool
  default     = "false"
  description = "Public ip association of ec2 instance"
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
variable "ec2_ebs_optimized" {
  type        = bool
  description = "EBS optimized settings"
  default     = "false"
}
variable "ec2_monitoring" {
  type        = bool
  description = "EC2 monitoring settings"
  default     = "false"
}

variable "subnet_ids_available" {
  type        = list(any)
  description = "Subnet IDs to be used."
}
variable "ec2_security_groups" {
  type        = list(any)
  default     = ["sg-0d409b1b848519f78", "sg-0fbd1f118ffa2108d"]
  description = "Subnet IDs to be used."
}

variable "standard_tags" {
  type = object({
    managed_by          = string
    warning_description = string
    BUDGET              = string
    PROJECT             = string
    BUSINESS            = string
    COST_CENTRE         = string
  })
  description = "List of standard tags for the EC2 instance"
}
