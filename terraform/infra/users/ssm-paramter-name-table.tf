resource "aws_ssm_parameter" "dynamodb-users-table" {

    name = "${var.environment}-dynamodb-users-table"
    type = "String"
    value = "${aws_dynamodb_table.users.name}" 
}

resource "aws_ssm_parameter" "email-gsi" {

    name = "${var.environment}-email-gsi"
    type = "String"
    value = "${var.environment}-email-gsi"
  
}

