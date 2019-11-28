provider "aws" {
  region                    = var.region
  shared_credentials_file   = var.cpath
  profile                   = var.profile
}

module "cognito-dev" {
    source          = "./modules"
    project         = "name"
    env             = "develop"
    email_config    = "email_arn"
    client1         = "admin"
    client2         = "gui"
    client3         = "machine"
    client4         = "name"
    domain1         = "*.domain.io"
}

module "cognito-test" {
    source          = "./modules"
    project         = "name"
    env             = "develop"
    email_config    = "email_arn"
    client1         = "admin"
    client2         = "gui"
    client3         = "machine"
    client4         = "name"
    domain1         = "*.domain.io"
}

module "cognito-stage" {
    source          = "./modules"
    project         = "name"
    env             = "develop"
    email_config    = "email_arn"
    client1         = "admin"
    client2         = "gui"
    client3         = "machine"
    client4         = "name"
    domain1         = "*.domain.io"
}