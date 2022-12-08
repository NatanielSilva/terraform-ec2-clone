terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}

module "copy_ec2" {
  source = "../modules"
  source_instance_id = "value"
}
