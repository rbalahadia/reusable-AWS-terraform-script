terraform {
  backend "s3" {
    bucket = "<input your bucket name here>"
    key    = "<input the name of your tfstate>"
    region = "<input your AWS region>"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.62.0"
    }
  }
}
provider "aws" {
  region = "<input your AWS region>"
}

module reusable_terraform {
  source  = "./module/"
  ##########NETWORK#################################################################
  vpc_cidr_block         = "100.0.160.0/20" #change if you want a different CIDR block
  public_subnet_a_cidr   = "100.0.160.0/24" #change if you want a different CIDR block
  public_subnet_b_cidr   = "100.0.161.0/24" #change if you want a different CIDR block
  private_subnet_a_cidr  = "100.0.168.0/24" #change if you want a different CIDR block
  private_subnet_b_cidr  = "100.0.169.0/24" #change if you want a different CIDR block
  ##########ENVIRONMENT#############################################################
  environment            = "dev" ##What environment is the infrastructure you're creating
  project_name           = "sample" ##Name of the project, This will be used on all naming conventions of the script
  terraform_bucket       = "input your bucket name here" ##Name of the bucket that will be used.
  ec2_instance_count     = 2 ##the number of instances to be created.
  ec2_instance_image     = "ami-033067239f2d2bfbc" ##Instance ami that will be used.
  ec2_instance_type      = "t3.medium" ##Instance type of the instances to be created.
  volume_size        = 40 ##Volume size of the instances to be created.
  ##########GLOBAL TAGS##############################################################
  standard_tags = {
    managed_by             = "Terraform"
    warning_description    = "This is a terraform project, DO NOT edit directly in AWS Console"
  } 
  ##TAGS that will be applied to ALL resources.
  ####Uncomment this section if you want to add an additional policy to your Instance policy/role
  #additional_instance_policy = <<EOT
  #        ,{
  #          "Effect": "Allow",
  #          "Action": "sts:AssumeRole",
  #          "Resource": "arn:aws:iam::aws_account_number:role/role_name"
  #        }
  #      EOT
}
