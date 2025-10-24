# Launch an EC2 Instance with Terraform

### This project demonstrates how to launch an EC2 instance using Terraform within a Learner Lab environment.

---

## Prerequisites

Before starting, make sure you have:

- Terraform installed → [Terraform Install Guide](https://developer.hashicorp.com/terraform/downloads)
- AWS credentials configured (via `aws configure` or environment variables)
- Access to a Learner Lab AWS account
- Basic knowledge of Terraform commands

---

##  Setup Instructions

###  Clone the Repository
```bash
git clone https://github.com/AJamell/TerraformPractice.git
cd TerraformPractice
```

### Configure Your Variables

Create a **terraform.tfvars** file and add your AWS credentials and preferences:
```bash
aws_access_key = "YOUR_ACCESS_KEY"
aws_secret_key = "YOUR_SECRET_KEY"
region         = "us-east-1"
key_name       = "YOUR_KEY_PAIR_NAME"
instance_type  = "t2.micro"
```

### Initialize Terraform
Initialize your Terraform working directory and download the AWS provider plugin:
```bash
terraform init
```

### Review the Execution Plan
Preview the resources that Terraform will create:
```bash
terraform plan
```


###  Deploy Your EC2 Instance
Apply your configuration to create the instance:
```bash
terraform apply
```

### Destroy the Infrastructure
To clean up and avoid unnecessary charges:
```bash 
terraform destroy
```



