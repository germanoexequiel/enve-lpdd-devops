# subnet for az a
resource "aws_subnet" "lpdd-ops-sn-a" {
  vpc_id     = "${aws_vpc.lpdd-ops-vpc.id}"
  cidr_block = "${var.lpdd-ops-sn-a-cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    type = "lpdd-ops-sn-a"
    env  = "ops"
    Name = "lpdd-ops-sn-a"
  }

}

resource "aws_route_table" "lpdd-ops-rt-public-a" {
  vpc_id = "${aws_vpc.lpdd-ops-vpc.id}"

  tags = {
    type = "lpdd-ops-rt-public-a"
    env  = "ops"
    Name = "lpdd-ops-rt-public-a"
  }

}

resource "aws_route" "lpdd-ops-int-route-a" {
  route_table_id         = "${aws_route_table.lpdd-ops-rt-public-a.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.lpdd-ops-igw.id}"

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_route_table_association" "lpdd-ops-rt-assoc-a" {
  subnet_id      = "${aws_subnet.lpdd-ops-sn-a.id}"
  route_table_id = "${aws_route_table.lpdd-ops-rt-public-a.id}"

  lifecycle {
    ignore_changes        = ["subnet_id", "route_table_id"]
    create_before_destroy = true
  }

}

# subnet for az b
resource "aws_subnet" "lpdd-ops-sn-b" {
  vpc_id     = "${aws_vpc.lpdd-ops-vpc.id}"
  cidr_block = "${var.lpdd-ops-sn-b-cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    type = "lpdd-ops-sn-b"
    env  = "ops"
    Name = "lpdd-ops-sn-b"
  }

}

resource "aws_route_table" "lpdd-ops-rt-public-b" {
  vpc_id = "${aws_vpc.lpdd-ops-vpc.id}"

  tags = {
    type = "lpdd-ops-rt-public-b"
    env  = "ops"
    Name = "lpdd-ops-rt-public-b"
  }

}

resource "aws_route" "lpdd-ops-int-route-b" {
  route_table_id         = "${aws_route_table.lpdd-ops-rt-public-b.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.lpdd-ops-igw.id}"

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_route_table_association" "lpdd-ops-rt-assoc-b" {
  subnet_id      = "${aws_subnet.lpdd-ops-sn-b.id}"
  route_table_id = "${aws_route_table.lpdd-ops-rt-public-b.id}"

  lifecycle {
    ignore_changes        = ["subnet_id", "route_table_id"]
    create_before_destroy = true
  }

}

