module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "aws-vpc-django-testing-${random_uuid.name.result}"
  cidr = "172.16.255.0/24"

  azs             = ["us-east-1a"]
  intra_subnets   = ["172.16.255.0/26"]
  public_subnets  = ["172.16.255.192/26"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "testing"
  }
}