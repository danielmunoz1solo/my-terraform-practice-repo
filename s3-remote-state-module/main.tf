terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.100.0"
    }
  }

  required_version = "1.12.2"
}

provider "aws" {
  region  = "us-west-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-remote-backend"

  tags = {
    Name        = "terraform-remote-state-storage"
    Environment = "Dev"
    Owner = "Daniel-Munoz"
  }
}