variable "centos_version" {
  default = "centos_1804_2"
}

variable "aws_default_region" {
  default = "us-east-1"
}

variable "aws_account_id" { }

variable "key_name" { }

variable "incoming_access" {
  default = ["0.0.0.0/0"]
}

variable "instance_type" {
  default = "t3.micro"
}

locals {
    ami = {
      centos_1804_2 = {
        ap-south-1 = "ami-48301d27"
        eu-west-3 = "ami-6276c71f"
        eu-west-2 = "ami-4726cb20"
        eu-west-1 = "ami-4c457735"
        ap-northeast-2 = "ami-46963e28"
        ap-northeast-1 = "ami-3185744e"
        sa-east-1 = "ami-c2e6baae"
        ca-central-1 = "ami-456aea21"
        ap-southeast-1 = "ami-da6151a6"
        ap-southeast-2 = "ami-0d13c26f"
        eu-central-1 = "ami-9a183671"
        us-east-1 = "ami-d5bf2caa"
        us-east-2 = "ami-77724e12"
        us-west-1 = "ami-3b89905b"
        us-west-2 = "ami-5490ed2c"
      },
      centos_1805_1 = {
        eu-north-1 = "ami-b133bccf"
        ap-south-1 = "ami-1780a878"
        eu-west-3 = "ami-262e9f5b"
        eu-west-2 = "ami-00846a67"
        eu-west-1 = "ami-3548444c"
        ap-northeast-2 = "ami-bf9c36d1"
        ap-northeast-1 = "ami-8e8847f1"
        sa-east-1 = "ami-cb5803a7"
        ca-central-1 = "ami-e802818c"
        ap-southeast-1 = "ami-8e0205f2"
        ap-southeast-2 = "ami-d8c21dba"
        eu-central-1 = "ami-dd3c0f36"
        us-east-1 = "ami-77ec9308"
        us-east-2 = "ami-9c0638f9"
        us-west-1 = "ami-4826c22b"
        us-west-2 = "ami-3ecc8f46"
      },
      centos_1901_1 = {
        eu-north-1 = "ami-5ee66f20"
        ap-south-1 = "ami-02e60be79e78fef21"
        eu-west-3 = "ami-0e1ab783dc9489f34"
        eu-west-2 = "ami-0eab3a90fc693af19"
        eu-west-1 = "ami-0ff760d16d9497662"
        ap-northeast-2 = "ami-06cf2a72dadf92410"
        ap-northeast-1 = "ami-045f38c93733dd48d"
        sa-east-1 = "ami-0b8d86d4bf91850af"
        ca-central-1 = "ami-033e6106180a626d0"
        ap-southeast-1 = "ami-0b4dd9d65556cac22"
        ap-southeast-2 = "ami-08bd00d7713a39e7d"
        eu-central-1 = "ami-04cf43aca3e6f3de3"
        us-east-1 = "ami-02eac2c0129f6376b"
        us-east-2 = "ami-0f2b4fc905b0bd1f1"
        us-west-1 = "ami-074e2d6769f445be5"
        us-west-2 = "ami-01ed306a12b7d1c96"
      }
    }

    ami_id = "${lookup(local.ami[var.centos_version], var.aws_default_region)}"
}