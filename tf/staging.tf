########################################
# staging resources
########################################

module "s3-bucket_staging-johnpearsall-com" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  bucket                   = "staging.johnpearsall.com"
  acl                      = "private"
  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  block_public_acls        = false
  block_public_policy      = false
  ignore_public_acls       = false
  restrict_public_buckets  = false

  versioning = {
    enabled = true
  }

  attach_policy = true
  policy        = jsonencode(
    {
      Statement = [
        {
          Action    = "s3:GetObject"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "arn:aws:s3:::staging.johnpearsall.com/*"
          Sid       = "PublicReadGetObject"
        },
      ]
      Version   = "2012-10-17"
    }
  )

  server_side_encryption_configuration = {
    rule = {
      bucket_key_enabled = true

      apply_server_side_encryption_by_default = {
        kms_master_key_id = null
        sse_algorithm     = "AES256"
      }
    }
  }

  website = {
    error_document           = "404.html"
    index_document           = "index.html"
  }
}

module "cf-staging-johnpearsall-com" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "3.4.0"

  aliases = ["staging.johnpearsall.com"]

  origin = {
    blog = {
      domain_name = "${module.s3-bucket_staging-johnpearsall-com.s3_bucket_id}.${module.s3-bucket_staging-johnpearsall-com.s3_bucket_website_domain}"

      custom_origin_config = {
        http_port = 80
        https_port = 443
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
      }
    }
  }

  default_cache_behavior = {
    target_origin_id = "blog"
    viewer_protocol_policy = "redirect-to-https"
    allowed_method = ["GET", "HEAD"]
  }

  viewer_certificate = {
    # implement infrastructure repo and pull this in from module exports.
    acm_certificate_arn = "arn:aws:acm:us-east-1:876138106250:certificate/3beec66d-51a8-4486-b63b-608b6edc30ad"
    ssl_support_method = "sni-only"
  }
}
