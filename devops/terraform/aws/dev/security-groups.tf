resource "aws_security_group" "lpdd-dev-sg" {
  name = "lpdd-dev-sg"
  description = "lpdd dev env security group"
  vpc_id      = "${aws_vpc.lpdd-dev-vpc.id}"

  ingress {
    from_port       = "${var.ssh-port}"
    to_port         = "${var.ssh-port}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.lpdd-ops-vpc-cidr}","${var.lpdd-dev-vpc-cidr}","${var.enve-public-ip1}"]
  }

  ingress {
    from_port       = "${var.http-port}"
    to_port         = "${var.http-port}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.lpdd-ops-vpc-cidr}","${var.lpdd-dev-vpc-cidr}","${var.enve-public-ip1}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

 tags = {
    Name = "lpdd-dev-sg"
 }

}
