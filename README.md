## Option 1 - Run manually on Terraform EC2 instance
1. Initialize Terraform

   - From root directory:
```
   terraform init
```
2. Create EC2 Runner
```
   terraform apply
```
   - After the EC2 instance is created, copy your VPC Terraform files to the EC2 using scp using your kp:
```
   scp -i path/to/key.pem -r ./vpc-sandbox-module ec2-user@<public-ip>:/home/ec2-user/
```

3. SSH into the EC2 Runner
```
   ssh -i path/to/key.pem ec2-user@<public-ip>
```
4. Run the VPC Terraform Module from EC2
```
   cd ~/vpc-module
   terraform init
   terraform apply
```
5. VPC sandbox up and running (current basic implementation only, no internet access yet) 

##### TODO: Add on IGW (and NGW) depending on use case, add route tables and sg as well

##### TODO: Automate script using github actions workflow, no need for EC2 instance

##### TODO: Clean up variable usage, cleaner modular setup

##### Any other recommendations?



## Option 2 - Run using Github Workflows