resource "aws_security_group" "djangoSecurityGroup" {
  name        = "djangoSecurityGroup-${random_uuid.name.result}"
  description = "django - Security Group"
  vpc_id      = "${module.vpc.vpc_id}"

  tags {
    Name      = "djangoSecurityGroup"
    Createdby = "Terraform"
  }
}

resource "aws_security_group_rule" "ingress_rule" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = "${var.incoming_access}"
  security_group_id = "${aws_security_group.djangoSecurityGroup.id}"
}

resource "aws_security_group_rule" "egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.djangoSecurityGroup.id}"
}
