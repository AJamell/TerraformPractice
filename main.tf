
// --to start run terraform init--
//	Downloads the provider plugins (AWS, Azure, etc.).
//	Sets up the .terraform directory and locks the provider versions.
//	Must run before anything else in a new project or after changing providers.

// --to plan run terraform plan--
//Shows you what Terraform will do without actually doing it.
//	Compares your current cloud resources vs your Terraform configuration.
// Outputs a plan with:
//	+ = create
//	~ = update
//	- = destroy
//you can save it to a file if needed. terraform plan -out=tfplan

// --to apply run terraform apply--
//	What it does: Actually executes the plan and creates/modifies/destroys resources.
//	By default, Terraform asks you to confirm (yes).

// --to destroy run terraform destroy--
// What it does: Tears down all the resources in your Terraform state.
//	Basically the “nuclear option” to clean up everything Terraform created.
//	You can also target specific resources if you want: terraform destroy -target=aws_instance.example


terraform {
  required_providers {
    aws = {
      //aws and version, version from 5 to 5.9.9 but not 6
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  // requried version of terraform, version 1.6 and up
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_session_token
}

// Create a basic EC2 instance
// aws_instance is a singular resource.
// The name "example" is just an internal Terraform identifier.
//to add more do count = number
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  // Security group to allow SSH
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  // Run a startup script
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y git
              cd /home/ec2-user
              git clone ${var.github_repo}
              EOF

  tags = {
    Name = "terraform-learnerlab-ec2"
  }
}

// Security group for SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  //going to the ec2 instance open on all networks to ssh prot
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  //ec2 going outside
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//	This declares an output variable called public_ip.
//	Terraform will print it after terraform apply.
output "public_ip" {
  value = aws_instance.example.public_ip
}


