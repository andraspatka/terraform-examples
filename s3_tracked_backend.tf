terraform {
  # Have s3 bucket + dynamodb table tracked in TF as well.
  #  Step 1: run terraform init
  #  Step 2: run terraform plan
  #  Step 3: If plan looks good, terraform apply -auto-approve
  #  Step 4: If apply is okay, then uncomment the below block.
  #  Step 5: terraform init
  #  Step 6: It will ask you if you want to copy the state from locally to S3. Say yes.
  #  Step 7: You can safely remove the local terraform.tfstate and terraform.tfstate.backup files.
#   backend "s3" {
#     # Backend block doesn't allow interpolation, have to hardcode values.
#     bucket         = "terraform-state"
#     key            = "terraform.state"
#     encrypt        = true
#     region         = "region"
#     dynamodb_table = "terraform-lock"
#   }
}

provider "aws" {
  region = "eu-west-2"
}

module "backend" {
  source              = "../../modules/aws_backend"
  s3_bucket_name      = "terraform-state"
  dynamodb_table_name = "terraform-lock"
}
