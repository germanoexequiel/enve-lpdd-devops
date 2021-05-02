variable "region" {
  default = "us-east-1"
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
  type    = "list"
}

variable "name" {
  default = "lpdd"
}

variable "project" {
  default = "fe"
}

variable "env" {
  default = "dev"
}

# vpc
variable "lpdd-ops-vpc-cidr" {
  default = "172.28.0.0/24"
}

variable "lpdd-dev-vpc-cidr" {
  default = "172.28.1.0/24"
}

variable "lpdd-dev-sn-a-cidr" {
  default = "172.28.1.0/26"
}

variable "lpdd-dev-sn-b-cidr" {
  default = "172.28.1.64/26"
}

variable "enve-public-ip1" {
  default = "190.114.169.42/32"
}

variable "ssh-port" {
  description = "allow SSH connections"
  default = 22
}

variable "http-port" {
  description = "allow HTTP requests"
  default = 3000
}

variable "key-name" {
  default = "lpdd-dev"
  description = "server key name"
}

variable "key" {
  default = "/opt/keys/lpdd/lpdd-dev.pem"
  description = "server key"
}

