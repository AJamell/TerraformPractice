
// changes everytime learner lab launches
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

// changes everytime learner lab launches
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

// changes everytime learner lab launches
variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

// changes everytime learner lab launches
variable "aws_session_token" {
  description = "AWS Session token"
  type        = string
  sensitive   = true
}

//os for linux aws
variable "ami_id" {
  description = "Amazon Linux 2023 kernal-6.1 AMI"
  type        = string
  default     = "ami-052064a798f08f0d3" // us-east-1 os
}

//t2.micro
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

//vocKey
variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

//repo clone https
variable "github_repo" {
  description = "GitHub repo to clone"
  type        = string
}