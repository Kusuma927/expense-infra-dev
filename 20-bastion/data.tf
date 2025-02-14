data "aws_ami" "joindevops" {
    most_recent = true
    owners = ["973714476881"]
    
    filter {
      name="name"
      values=["RHEL-9 Devops-practice"]
    }

    filter {
      name="root-device-type"
      values=["ebs"]
    }
    filter {
      name="virtualization-type"
      values=["hvm"]
    }
}

## To get the data i.e., bastion from Parameter store
data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion_sg_id"
}

## To get the data i.e., bastion from Parameter store
data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project_name}/${var.environment}/public_subnet_id"
}
