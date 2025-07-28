resource "aws_cloudfront_distribution" "tf_cf_distribution" {
  enabled = "true"
  origin {
    domain_name = aws_s3_bucket.tf_s3_bucket.bucket_regional_domain_name
    origin_id = "myS3Origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.tf_cf_oac.id
  }
  viewer_certificate {
    cloudfront_default_certificate = "true"
  }
  default_cache_behavior {
   allowed_methods        = ["GET", "HEAD", "OPTIONS"]
   cached_methods         = ["GET", "HEAD"]
   viewer_protocol_policy = "redirect-to-https"
   target_origin_id = "myS3Origin"

   forwarded_values {
     query_string = "false"
     cookies {
       forward = "none"
     }
   }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  depends_on = [ aws_s3_bucket.tf_s3_bucket,aws_s3_object.tf_s3_object,aws_s3_bucket_policy.tf_s3_bucket_policy ]
 
}

resource "aws_cloudfront_origin_access_control" "tf_cf_oac" {
  name = "TF_OAC_S3"
  origin_access_control_origin_type = "s3"
  signing_protocol = "sigv4"
  signing_behavior = "always"

  #depends_on = [ aws_cloudfront_distribution.tf_cf_distribution ]
}
