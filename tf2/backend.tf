terraform {
  backend "s3" {
    bucket         = "johnmark-tf-state"
    key            = "state/terraform.tfstate"
    region         = "us-east-2"
    profile        = "tf_user1"
    dynamodb_table = "johnmark-dynamo-tf-test"
  }
}