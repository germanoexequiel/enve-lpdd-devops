# getting the needed vpc id's  
data "aws_vpc" "lpdd-ops-vpc" {
  tags = {
    Name = "lpdd-ops-vpc"
  }
}

output "lpdd-ops-vpc" {
  value = data.aws_vpc.lpdd-ops-vpc.id
}

data "aws_vpc" "lpdd-dev-vpc" {
  tags = {
    Name = "lpdd-dev-vpc"
  }
}

output "lpdd-dev-vpc" {
  value = data.aws_vpc.lpdd-dev-vpc.id
}

# peering connection for ops and dev vpc's
resource "aws_vpc_peering_connection" "lpdd-ops-peering" {
  peer_vpc_id   = "${data.aws_vpc.lpdd-dev-vpc.id}"
  vpc_id        = "${data.aws_vpc.lpdd-ops-vpc.id}"
  auto_accept   = "true"

  tags = {
    Name = "vpc peering connection between ops and dev"
  }
}

