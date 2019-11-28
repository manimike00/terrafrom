resource "aws_cognito_user_pool" "pool" {
  name = "${var.project}-${var.env}"
  username_attributes =  ["email"]
  schema {
      attribute_data_type = "String"
      required = true
      name = "name"
      mutable = true
  }
  schema {
      attribute_data_type = "String"
      required = true
      name = "email"
      mutable = true
  }
  schema {
      attribute_data_type = "String"
      required = true
      name = "picture"
      mutable = true
  }
  schema {
      attribute_data_type = "String"
      name = "access_level"
      mutable = true
  }
  schema {
      attribute_data_type = "String"
      name = "role"
      mutable = true
  }
  password_policy {
      minimum_length = 8
      require_lowercase = true
      require_numbers = true
  }

  email_configuration {
     source_arn = "${var.email_config}"
     email_sending_account = "DEVELOPER"
  }

  auto_verified_attributes = ["email"]

  tags = {
      Project = "${var.project}"
      Environment = "${var.env}"
  }

}


