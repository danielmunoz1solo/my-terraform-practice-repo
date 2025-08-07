terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.100.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5"
    }
  }
  required_version = "1.12.2"
  backend "s3" {
    bucket = "dev-state-management-daniel"
    key    = "dev-env/terraform.tfstate"
    region = "us-west-1"
    # profile = "dev-soLo-daniel"       Only needed for local dev
  }
}

provider "aws" {
  region = "us-west-1"
  # profile = "dev-soLo-daniel"     Only needed for local dev
  default_tags {
    tags = local.solo_tags
  }
}