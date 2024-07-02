# reusable-AWS-terraform-script
This is a reusable **terraform** script for creating an entire **AWS** infrastructure.

Services included in this re-usable terraform.
1. VPC
   a. 2 Private subnets
   b. 2 Public subnets
   c. 1 Internet gateway
   d. 1 NAT gateway
2. EC2 instances (number of instance depends on count)
   a. Security group
   b. pem file
   c. userdata
3. Application Load Balancer
4. Target groups
5. Web Application Firewall
6. Cloudfront
