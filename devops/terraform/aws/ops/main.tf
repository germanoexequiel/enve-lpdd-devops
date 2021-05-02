provider "aws" {
  region = "${var.region}"
}

# terraform bucket state definition 
#terraform {
#  backend "s3" {
#    bucket = "lpdd-tf-state"
#    key = "ops/lpdd-ops-tf-state"
#    region = "us-east-1"
#  }
#}
