# Security Group allowing SSH for the ec2-runner
resource "aws_security_group" "ssh_access" {
  name        = "ssh-access"
  description = "Allow SSH access"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# IAM role for ec2 runner
resource "aws_iam_role" "ec2_runner_role" {
  name = "ec2-runner-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Attach ec2 + vpc Full Access Policy
# resource "aws_iam_role_policy_attachment" "ec2_access" {
#   role       = aws_iam_role.ec2_runner_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
# }

resource "aws_iam_role_policy_attachment" "vpc_access" {
  role       = aws_iam_role.ec2_runner_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

# === IAM Instance Profile ===
resource "aws_iam_instance_profile" "ec2_runner_profile" {
  name = "ec2-runner-instance-profile"
  role = aws_iam_role.ec2_runner_role.name
}

resource "aws_instance" "terraform_runner" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_runner_profile.name
  associate_public_ip_address = true
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum install -y yum-utils
              yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
              yum -y install terraform
            EOF

  tags = {
    Name = "terraform-ec2-runner"
  }
}

