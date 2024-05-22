terraform {

  backend "s3" {
    bucket = "xavier-delgado-bucket"
    key = "mystate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

module "security_group" {
  source = "./modules/security_group"
}

module "instances" {
  source = "./modules/instances"
  
  instance_key = var.instance_key
  security_group_name = module.security_group.security_group_name
}