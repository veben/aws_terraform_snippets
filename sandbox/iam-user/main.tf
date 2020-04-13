provider "aws" {
  region = "eu-west-1"
  shared_credentials_file = "C:\\Users\\8471VG\\.aws\\credentials"
  profile                 = "terrafom-perso"
}

module "iam_user" {
  source = "../../modules/iam-user"
  name = "test"
}