output "external_access" {
    value = "${aws_eip.django_eip.public_ip}"
}
