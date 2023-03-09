provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "devinstance" {
  ami           = "ami-0ff7189cf12ed8eb6" # us-east-1
  instance_type = "t2.micro"
  encrypted     = true
    ebs_optimized = true
    monitoring = true  
    iam_instance_profile = "devops"

  tags = {
      Name = "dev-Instance"
      Managedby = "Terraform"
  }
}
