resource "aws_ssm_parameter" "jwt-secret" {
    name = "${var.environment}-jwt-secret"
    type = "String"
    value = "${var.jwt_secret}"
  
}
