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
  default = "ops"
}

variable "env" {
  default = "ops"
}

# vpc
variable "lpdd-ops-vpc-cidr" {
  default = "172.28.0.0/24"
}

variable "lpdd-ops-sn-a-cidr" {
  default = "172.28.0.0/26"
}

variable "lpdd-ops-sn-b-cidr" {
  default = "172.28.0.64/26"
}

variable "enve-public-ip1" {
  default = "190.114.169.53/32"
}

variable "ssh-port" {
  description = "allow SSH connections"
  default = 22
}

variable "http-port" {
  description = "allow HTTP requests"
  default = 80
}

variable "key-name" {
  default = "lpdd-ops"
  description = "server key name"
}

# cambiar la llave el dia que configure este entorno. Tener en cuenta esta parte
variable "key" {
  default = "/opt/keys/lpdd/lpdd-ops.pem"
  description = "server key"
}
