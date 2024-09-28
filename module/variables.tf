
#####EC2#####
variable "ec2_instance_image" {
      type = string
      description = "Instance image id. eg. ami-xxxx"
      default = "ami-033067239f2d2bfbc"
}

variable "ec2_instance_type" {
  type    = string
  default = "t3.medium"
  description = "EC2 Instance type"
}
variable "ec2_instance_count" {
  type    = string
  default = "1"
  description = "number of EC2 instance to create"
}
#####GLOBAL#####
variable "environment" {
      type = string
      description = "acronym to designate the stage of the environment. E.g. dev, int, prd, ...)"
      default = "dev"
}
variable "project_name" {
      type = string
      description = "input project name"
      default = "dummy"
}
variable "volume_size" {
      type = string
      description = "Input your volume size"
      default = "10"
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
