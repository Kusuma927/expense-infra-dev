resource "aws_ssm_parameter" "web_alb_certificate_arn" {
  name  = "/${var.project_name}/${var.environment}/web_alb_certificate_arn"
  type  = "String"
  value = web_alb_certificate_arn.expense.arn
}