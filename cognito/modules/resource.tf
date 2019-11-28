resource "aws_cognito_resource_server" "resource1" {
  identifier = "https://localhost.com"
  name       = "columbus"

  user_pool_id = "${aws_cognito_user_pool.pool.id}"

}

resource "aws_cognito_resource_server" "resource3" {
  identifier = "name-of-identifier"
  name       = "name"

  user_pool_id = "${aws_cognito_user_pool.pool.id}"

  scope {
    scope_name        = "post"
    scope_description = "post name"
  }
  scope {
    scope_name        = "get"
    scope_description = "get name"
  }
}

