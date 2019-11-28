#data "aws_acm_certificate" "cert" {
#  domain      = "${var.domain1}"
#  types       = ["AMAZON_ISSUED"]
#  most_recent = true
#}

resource "aws_cognito_user_pool_domain" "domain1" {
  domain       = "${var.project}-${var.env}"
  user_pool_id = "${aws_cognito_user_pool.pool.id}"
}

#resource "aws_cognito_user_pool_domain" "domain2" {
#  domain          = "devopstest-idp-syn.geospoc.io"
#  certificate_arn = "${data.aws_acm_certificate.cert.arn}"
#  user_pool_id    = "${aws_cognito_user_pool.pool.id}"
#}

