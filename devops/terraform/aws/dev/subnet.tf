# subnet for az a
resource "aws_subnet" "lpdd-dev-sn-a" {
  vpc_id     = "${aws_vpc.lpdd-dev-vpc.id}"
  cidr_block = "${var.lpdd-dev-sn-a-cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    type = "lpdd-dev-sn-a"
    env  = "dev"
    Name = "lpdd-dev-sn-a"
  }

}

resource "aws_route_table" "lpdd-dev-rt-public-a" {
  vpc_id = "${aws_vpc.lpdd-dev-vpc.id}"

  tags = {
    type = "lpdd-dev-rt-public-a"
    env  = "dev"
    Name = "lpdd-dev-rt-public-a"
  }

}

resource "aws_route" "lpdd-dev-int-route-a" {
  route_table_id         = "${aws_route_table.lpdd-dev-rt-public-a.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.lpdd-dev-igw.id}"

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_route_table_association" "lpdd-dev-rt-assoc-a" {
  subnet_id      = "${aws_subnet.lpdd-dev-sn-a.id}"
  route_table_id = "${aws_route_table.lpdd-dev-rt-public-a.id}"

  lifecycle {
    ignore_changes        = ["subnet_id", "route_table_id"]
    create_before_destroy = true
  }

}

# subnet for az b
resource "aws_subnet" "lpdd-dev-sn-b" {
  vpc_id     = "${aws_vpc.lpdd-dev-vpc.id}"
  cidr_block = "${var.lpdd-dev-sn-b-cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    type = "lpdd-dev-sn-b"
    env  = "dev"
    Name = "lpdd-dev-sn-b"
  }

}

resource "aws_route_table" "lpdd-dev-rt-public-b" {
  vpc_id = "${aws_vpc.lpdd-dev-vpc.id}"

  tags = {
    type = "lpdd-dev-rt-public-b"
    env  = "dev"
    Name = "lpdd-dev-rt-public-b"
  }

}

resource "aws_route" "lpdd-dev-int-route-b" {
  route_table_id         = "${aws_route_table.lpdd-dev-rt-public-b.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.lpdd-dev-igw.id}"

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_route_table_association" "lpdd-dev-rt-assoc-b" {
  subnet_id      = "${aws_subnet.lpdd-dev-sn-b.id}"
  route_table_id = "${aws_route_table.lpdd-dev-rt-public-b.id}"

  lifecycle {
    ignore_changes        = ["subnet_id", "route_table_id"]
    create_before_destroy = true
  }

}

