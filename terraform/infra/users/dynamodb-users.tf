resource "aws_dynamodb_table" "users" {
    name = "${var.environment}-users"
    hash_key = "id"
    attribute{
        name = "id"
        type = "S"
    }
    attribute{
        name = "email"
        type = "S"
    }
    global_secondary_index {
    name               = "${var.environment}-email-gsi"
    hash_key           = "email"
    write_capacity     = "${var.write_capacity}"
    read_capacity      = "${var.write_capacity}"
    projection_type    = "ALL"
  }
    write_capacity = "${var.write_capacity}"
    read_capacity =  "${var.read_capacity}"  
}

resource "aws_dynamodb_table_item" "admin" {
  table_name = "${aws_dynamodb_table.users.name}"
  hash_key   = "${aws_dynamodb_table.users.hash_key}"

  item = <<ITEM
{
  "id": {"S": "${var.admin_id}"},
  "email": {"S": "${var.admin_email}"},
  "password": {"S": "${var.admin_password}"},
  "role": {"S": "ADMIN"},
  "name": {"S": "${var.admin_name}"}
}
ITEM
}
