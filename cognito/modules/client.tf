resource "aws_cognito_user_pool_client" "client1" {
  name                 = "${var.client1}"
  user_pool_id         = "${aws_cognito_user_pool.pool.id}"
  explicit_auth_flows  = ["ADMIN_NO_SRP_AUTH"]
  generate_secret      = true
}



resource "aws_cognito_user_pool_client" "client2" {
  name                                 = "${var.client2}"
  user_pool_id                         = "${aws_cognito_user_pool.pool.id}"
  explicit_auth_flows                  = ["ADMIN_NO_SRP_AUTH"]
  generate_secret                      = true
  supported_identity_providers         = ["COGNITO"]
  callback_urls                        = "${var.env != "stage" ? ["http://localhost/auth/callback","http://localhost:8080/auth/callback", "https://${var.env}-account-syn.geospoc.io/auth/callback", "https://${var.env}-admin-syn.geospoc.io/auth/callback", "https://${var.env}-col-syn.geospoc.io/auth/callback", "https://${var.env}-ws3-syn.geospoc.com/auth/callback"] : ["https://${var.env}-account-syn.geospoc.io/auth/callback", "https://${var.env}-admin-syn.geospoc.io/auth/callback", "https://${var.env}-col-syn.geospoc.io/auth/callback", "https://${var.env}-ws3-syn.geospoc.com/auth/callback"] }"
  logout_urls                          = "${var.env != "stage" ? ["http://localhost/auth/logout", "http://localhost:8080/auth/logout", "https://${var.env}-account-syn.geospoc.io/auth/logout", "https://${var.env}-admin-syn.geospoc.io/auth/logout", "https://${var.env}-col-syn.geospoc.io/auth/logout", "https://${var.env}-ws3-syn.geospoc.com/auth/logout"] : ["https://${var.env}-account-syn.geospoc.io/auth/logout", "https://${var.env}-admin-syn.geospoc.io/auth/logout", "https://${var.env}-col-syn.geospoc.io/auth/logout", "https://${var.env}-ws3-syn.geospoc.com/auth/logout"] }"
  allowed_oauth_flows                  = ["code","implicit"]
  allowed_oauth_scopes                 = ["phone","openid","email","profile"]
  allowed_oauth_flows_user_pool_client = true
}


resource "aws_cognito_user_pool_client" "client3" {
  name                    = "${var.client3}"
  user_pool_id            = "${aws_cognito_user_pool.pool.id}"
  generate_secret         = true
  explicit_auth_flows     = ["ADMIN_NO_SRP_AUTH"]
  allowed_oauth_flows	  = ["client_credentials"]
}

resource "aws_cognito_user_pool_client" "client4" {
  name                                  = "${var.client4}"
  user_pool_id                          = "${aws_cognito_user_pool.pool.id}"
  explicit_auth_flows                   = ["ADMIN_NO_SRP_AUTH"]
  generate_secret                       = true 
  supported_identity_providers          = ["COGNITO"]
  allowed_oauth_flows                   = ["client_credentials"]
  allowed_oauth_flows_user_pool_client  = true
  allowed_oauth_scopes                  = "${aws_cognito_resource_server.resource3.scope_identifiers}"
}


