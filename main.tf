terraform {
  backend "s3" {
    bucket = "input your bucket name here"
    key    = "input the name of your tfstate"
    region = "input your AWS region"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.62.0"
    }
  }
}
provider "aws" {
  region = "enter your aws region"
}

module reusable_terraform {
  source  = "./module/"
  ##########NETWORK#################################################################
  vpc_cidr_block         = "100.0.160.0/20"
  public_subnet_a_cidr   = "100.0.160.0/24"
  public_subnet_b_cidr   = "100.0.161.0/24"
  private_subnet_a_cidr  = "100.0.168.0/24"
  private_subnet_b_cidr  = "100.0.169.0/24"
  environment            = "dev" ##What environment is the infrastructure you're creating
  project_name           = "sample" ##Name of the project, This will be used on all naming conventions of the script
  terraform_bucket       = "test-tf-state-russell" ##Name of the bucket that will be used.
  ec2_instance_count     = 1
  ec2_instance_image     = "ami-0ba84480150a07294" ##the number of instances to be created.
  ec2_instance_type      = "t3.medium" ##Instance type of the instances to be created.
  volume_size        = 40 ##Volume size of the instances to be created.
  #db_size            = 100 ##RDS volume size in GB
  #db_class           = "db.t3.micro" ##RDS Instance type
  #db_multi_az        = true

  ####Uncomment this section if you want to add an additional policy to your Instance policy/role
  #additional_instance_policy = <<EOT
  #        ,{
  #          "Effect": "Allow",
  #          "Action": "sts:AssumeRole",
  #          "Resource": "arn:aws:iam::aws_account_number:role/role_name"
  #        }
  #      EOT

  standard_tags = {
    managed_by             = "Terraform"
    warning_description    = "This is a terraform project, DO NOT edit directly in AWS Console"
  } ##TAGS that will be applied to ALL resources.
}
