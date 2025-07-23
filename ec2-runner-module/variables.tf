variable "ssh_cidr" {
  description = "CIDR block allowed to SSH into our EC2"
  type = string 
  default = "0.0.0.0/0"
}

variable "ami_id" {
  description = "ami used for ec2-runner, default to amazon linux"
  type = string
  default = "ami-0b5358e1f13744bc7"
}

variable "instance_type" {
  description = "instance type for the ec2-runnner"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "name of your key pair for ssh access"
  type        = string
  default = "daniel-terraform-kp"
}
