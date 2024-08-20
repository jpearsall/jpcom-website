module "s3-bucket_jpcom_website" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  bucket                   = "jpcom_website"
  acl                      = "private"
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}