resource "aws_acm_certificate" "cert" {
    domain_name = "*.${var.domain_name}"
    validation_method = "DNS"
    tags = merge(
        var.common_tags,
        {
            Name="${var.project_name}-${var.environment}"
        }
    )
  
}
#performing DNS validation
resource "aws_route53_record" "expense" {
  for_each = {
    for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.expense.zone_id
}

#Validating
resource "aws_acm_certificate_validation" "expense" {
  certificate_arn         = aws_acm_certificate.expense.arn
  validation_record_fqdns = [for record in aws_route53_record.expense : record.fqdn]
}