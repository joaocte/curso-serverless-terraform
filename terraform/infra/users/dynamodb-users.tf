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

