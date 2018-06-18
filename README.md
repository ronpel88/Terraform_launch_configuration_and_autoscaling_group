# Terraform launch configuration & autoscaling group

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.
The key features of Terraform are:  
* Infrastructure as Code  
* Execution Plans  
* Resource Graph  
* Change Automation  

Here we implemented launch configuration & autoscaling group 

## Application Description

* variables.tf - definition of variables used in auto_scaling.tf
* terraform.tfvars - values of variables used in auto_scaling.tf
* auto_scaling.tf - terraform logic code

## Preparations

In order to run this, there are a few things that need to be in place:

* make sure you have .aws/credentials configured
* make sure you have [terraform installed](https://www.terraform.io/intro/getting-started/install.html)
* run `terraform init` 

## Running

* run `terraform plan` - to view the autoscaling plan
* run `terraform apply` - to execute the autoscaling plan

## Output

you should have the defined resources in aws ec2 console
