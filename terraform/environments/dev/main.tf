module "users" {
  source = "../../infra/users"
  environment = "${var.environment}"
  write_capacity = "${var.write_capacity}"
  read_capacity = "${var.read_capacity}"
  jwt_secret = "${var.jwt_secret}"
  admin_id = "${var.admin_id}"
  admin_email = "${var.admin_email}"
  admin_password = "${var.admin_password}"
  admin_name = "${var.admin_name}"
  
}

module "bookings" {
  source = "../../infra/booking"
  environment = "${var.environment}"
  write_capacity = "${var.write_capacity}"
  read_capacity = "${var.read_capacity}"  
  sns_notifications_arn = "${module.notifications.notifications_topic_arn}"
}

module "notifications" {
  source = "../../infra/notifications"
  environment = "${var.environment}"
}
