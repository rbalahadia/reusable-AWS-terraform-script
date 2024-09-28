# Reusable-AWS-terraform-script
This is a reusable **terraform** script for creating an entire **AWS** infrastructure.

Only need to add values in **main.tf** for the dynamic changes in the infrastructure.

_Versions:_
Terraform version  : **v1.9.4**
AWS module version : **v5.62.0**

_Services included in this re-usable terraform._
1. VPC
   a. 2 Private subnets
   b. 2 Public subnets
   c. 1 Internet gateway
   d. 1 NAT gateway
2. EC2 instance/s (number of instance depends on count)
   a. Security group
   b. userdata 
3. Application Load Balancer
   a. Security group
4. Target groups
5. Web Application Firewall
6. Cloudfront

_steps to run/apply the TF:_
1. Clone the repository.
2. Make sure you have terraform 1.9.4 in your local
3. Update main.tf to your desired parameters of your infra( name, region, etc.)
4. EXPORT AWS_ACCESS_KEY_ID="xxxxxxxx"
5. EXPORT AWS_SECRET_ACCESS_KEY="xxxxxxxx"
6. Run terraform init
7. Run terraform plan
8. Run terraform apply
9. Congratulations! you should see your new Infra in your AWS account.


**_Feel free to clone this repository as basis for your own terraform :)_ **

Created by: Russell Balahadia
