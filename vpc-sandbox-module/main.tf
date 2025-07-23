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

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

tags = {
    Name = "dev-sandbox-vpc"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                   = aws_vpc.main.id
  cidr_block               = var.public_subnet_cidr
  tags = {
    Name = "public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  tags = {
    Name = "private-subnet"
  }
}