provider "aws" {
  region     = "${var.aws_default_region}"
  allowed_account_ids = ["${var.aws_account_id}"]

  # assume_role {
  #   role_arn = "arn:aws:iam::${var.aws_account_id}:role/account-admin-iam-role"
  # }
}

resource "random_uuid" "name" { }

resource "aws_eip" "django_eip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  allocation_id = "${aws_eip.django_eip.id}"
  network_interface_id = "${aws_network_interface.django_external.id}"
}

resource "aws_network_interface" "django_external" {
  subnet_id = "${module.vpc.public_subnets[0]}"
  security_groups = ["${aws_security_group.djangoSecurityGroup.id}"]

  tags {
    Name      = "django external interface ${random_uuid.name.result}"
    Createdby = "Terraform"
  }
}

resource "aws_instance" "django" {
  ami                  = "${local.ami_id}"
  instance_type        = "${var.instance_type}"
  key_name             = "${var.key_name}"

  network_interface {
    network_interface_id = "${aws_network_interface.django_external.id}"
    device_index         = 0
  }

  tags {
    Name        = "django-${random_uuid.name.result}"
    Terraform   = "true"
    Environment = "test"
  }
}