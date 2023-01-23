
module "common" {
  source = "../common-infrastructure/"
  environment = "live"
}

terraform {
  required_version = "~> 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "net-slaszor-tfstate-live"
    region         = "eu-west-1"
    key            = "iaac.tfstate"
    dynamodb_table = "terraform-locks-live"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      "user:application" = "common-iaac"
    }
  }
}