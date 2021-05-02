resource "aws_vpc" "lpdd-ops-vpc" {
  cidr_block           = "${var.lpdd-ops-vpc-cidr}"
  enable_dns_hostnames = "true"

  tags = {
    type = "lpdd-ops-vpc"
    env  = "ops"
    Name = "lpdd-ops-vpc"
  }

}

resource "aws_internet_gateway" "lpdd-ops-igw" {
  vpc_id = "${aws_vpc.lpdd-ops-vpc.id}"

  tags = {
    type = "lpdd-ops-igw"
    env  = "ops"
    Name = "lpdd-ops-igw"
  }

}
