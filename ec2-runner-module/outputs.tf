# Runner IP address
output "ec2_public_ip" {
  value = aws_instance.terraform_runner.public_ip
}