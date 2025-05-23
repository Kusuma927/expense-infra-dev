variable "vpc_cidr" {
    default =  "10.0.0.0/16"  
}
variable "environment" {
   default = "dev"
}
variable "project_name" {
  default = "expense"
}
variable "common_tags" {
    default = {
        Project="expense"
        Environment="dev"
        Terraform="true"
    }  
}
variable "vpc_tags" {
    default = {
        purpose="assignment"
    }  
}
variable "public_subnet_cidr" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnet_cidr" {
    default = ["10.0.11.0/24", "10.0.12.0/24"]
}
variable "database_subnet_cidr" {
    default = ["10.0.21.0/24", "10.0.22.0/24"]
}