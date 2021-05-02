resource "aws_security_group" "lpdd-ops-cicd-sg" {
  name = "lpdd-ops-cicd-sg"
  description = "lpdd ops cicd security group"
  vpc_id      = "${aws_vpc.lpdd-ops-vpc.id}"

  ingress {
    from_port       = "${var.ssh-port}"
    to_port         = "${var.ssh-port}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.lpdd-ops-vpc-cidr}","${var.enve-public-ip1}"]
  }

  ingress {
    from_port       = "${var.http-port}"
    to_port         = "${var.http-port}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.lpdd-ops-vpc-cidr}","${var.enve-public-ip1}"] 
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

 tags = {
    Name = "lpdd-ops-cicd-sg"
 }

}
