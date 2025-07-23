terraform {
  backend "s3" {
    bucket = "tf-remote-backend"
    key = "vpc-sandbox-module/terraform.tfstate"
    region = "us-west-1"
  }
}