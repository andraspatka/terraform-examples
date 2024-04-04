variable s3_bucket_name {
  description = "The name of the S3 bucket to create for the storage of the TF state file."
  type        = string
}

variable dynamodb_table_name {
  description = "The name of the DynamoDB table to create for locking the TF state file."
  type        = string
}

variable deletion_protection {
  description = "Enable/disable deletion protection"
  default     = true
  type        = bool
}
