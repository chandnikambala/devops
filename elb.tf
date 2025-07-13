resource "aws_elb" "myelb" {
  name   = "terraform-ELB"

  subnets = [
    aws_subnet.public_subnet.id,
    aws_subnet.public_subnet_two.id
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
