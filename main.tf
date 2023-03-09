provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "devinstance" {
  ami           = "ami-0ff7189cf12ed8eb6" # us-east-1
  instance_type = "t2.micro"
  tags = {
      Name = "dev-Instance"
      Managedby = "Terraform"
  }
}
