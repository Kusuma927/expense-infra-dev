## This is a open source module
module "alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = true ### It will let us know, whether the load balancer is public/private.. It is set to true tht means it is private
  # expense-dev-app-alb
  name    = "${var.project_name}-${var.environment}-app-alb"
  vpc_id  = data.aws_ssm_parameter.vpc_id.value
  subnets = local.private_subnet_ids
  create_security_group = false ## Given false, as we are not using the custom created.
  security_groups = [local.app_alb_sg_id] ## Since we are not creating the custom security group, creating our own.
  enable_deletion_protection = false ## No one will delete by default if it is set to true. Since it is practice we are setting it to false.
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-app-alb"
    }
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = module.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hello, I am from backend APP ALB</h1>"
      status_code  = "200"
    }
  }
}


resource "aws_route53_record" "app_alb" {
  zone_id = var.zone_id
  name    = "*.app-dev.${var.domain_name}"
  type    = "A"

  # these are ALB DNS name and zone information
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = false
  }
}