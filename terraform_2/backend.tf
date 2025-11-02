terraform { 
	backend "s3" {
	bucket = "omer-tf-state"
	key = "state/terraform.tfstate"
	region = "us-east-2"
	profile = "default"
    dynamodb_table = "omer-tf-dynamoDB"
	}
}