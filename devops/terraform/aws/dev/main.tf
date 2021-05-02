provider "aws" {
  region = "${var.region}"
}

# terraform bucket state definition 
#terraform {
#  backend "s3" {
#    bucket = "lpdd-tf-state"
#    key = "dev/lpdd-dev-tf-state"
#    region = "us-east-1"
#  }
#}
