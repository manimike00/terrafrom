resource "aws_iam_role" "cognito-group-role" {
  name = "${var.project}-${var.env}-cognito-group-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Federated": "cognito-identity.amazonaws.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "cognito-group-policy" {
  name   = "${var.project}-${var.env}-cognito-group-policy"
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "mobileanalytics:PutEvents",
                "cognito-sync:*",
                "cognito-identity:*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "attach" {
  role  = "${aws_iam_role.cognito-group-role.name}"
  policy_arn = "${aws_iam_policy.cognito-group-policy.arn}"
}



resource "aws_cognito_user_group" "ws1" {
  name         = "name"
  user_pool_id = "${aws_cognito_user_pool.pool.id}"
  description  = "ws1"
  precedence   = 1
  role_arn     = "${aws_iam_role.cognito-group-role.arn}"
}

resource "aws_cognito_user_group" "ws2" {
  name         = "name"
  user_pool_id = "${aws_cognito_user_pool.pool.id}"
  description  = "ws2"
  precedence   = 2
  role_arn     = "${aws_iam_role.cognito-group-role.arn}"
}

resource "aws_cognito_user_group" "ws3" {
  name         = "name"
  user_pool_id = "${aws_cognito_user_pool.pool.id}"
  description  = "ws3"
  precedence   = 2
  role_arn     = "${aws_iam_role.cognito-group-role.arn}"
}

resource "aws_cognito_user_group" "admin" {
  name         = "admin"
  user_pool_id = "${aws_cognito_user_pool.pool.id}"
  description  = "admin"
  precedence   = 2
  role_arn     = "${aws_iam_role.cognito-group-role.arn}"
}

