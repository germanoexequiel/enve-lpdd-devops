resource "aws_vpc" "lpdd-dev-vpc" {
  cidr_block           = "${var.lpdd-dev-vpc-cidr}"
  enable_dns_hostnames = "true"

  tags = {
    type = "lpdd-dev-vpc"
    env  = "dev"
    Name = "lpdd-dev-vpc"
  }

}

resource "aws_internet_gateway" "lpdd-dev-igw" {
  vpc_id = "${aws_vpc.lpdd-dev-vpc.id}"

  tags = {
    type = "lpdd-dev-igw"
    env  = "dev"
    Name = "lpdd-dev-igw"
  }

}
