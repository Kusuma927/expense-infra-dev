variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}


variable "zone_id" {
    default = "Z0828358TI9NM5MO4QV9"
    
}

variable "domain_name" {
    default = "devopsdaws82s.online"
}