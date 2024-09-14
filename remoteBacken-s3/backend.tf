terraform {
    backend "s3" {
        bucket          = "my-terraform-state-bucket"
        key             = "vpc/terraform.tfstate"
        region          = "us-east-1"
        dynamodb_table  = "terraform-state-lock"
        encrypt         = true
    }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
    name         = "terraform-state-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}
