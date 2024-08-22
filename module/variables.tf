
#####EC2#####
variable "ec2_instance_image" {
      type = string
      description = "Instance image id. eg. ami-xxxx"
      default = "dummy"
}

variable "ec2_instance_type" {
  type    = string
  default = "t3.medium"
  description = "EC2 Instance type for Sonar instance"
}
variable "ec2_instance_count" {
  type    = string
  default = "1"
  description = "EC2 Instance type for Sonar instance"
}
#####GLOBAL#####
variable "environment" {
      type = string
      description = "acronym to designate the stage of the environment. E.g. dev, int, prd, ...)"
      default = "dummy"
}
variable "project_name" {
      type = string
      description = "input project name"
      default = "dummy"
}
variable "volume_size" {
      type = string
      description = "input project name)"
      default = "dummy"
}

variable "terraform_bucket" {
      type = string
      description = "name of terraform bucket"
      default = "dummy"
}
variable "standard_tags" {
  type =  object({
    managed_by                 = string
    warning_description        = string
  })
  description = "List of standard tags for the EC2 instance"
}
variable "vpc_cidr_block" {
      type = string
      default = "dummy"
      description = "What VPC to be used for the network"
}
variable "public_subnet_a_cidr" {
      type = string
      default = "dummy"
      description = "Public subnet A id"
}
variable "public_subnet_b_cidr" {
      type = string
      default = "dummy"
      description = "Public subnet B id"
}
variable "private_subnet_a_cidr" {
      type = string
      default = "dummy"
      description = "Private subnet A id"
}
variable "private_subnet_b_cidr" {
      type = string
      default = "dummy"
      description = "Private subnet A id"
}
