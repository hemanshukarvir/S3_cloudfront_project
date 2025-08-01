resource "aws_s3_bucket" "tf_s3_bucket" {
    bucket = "tf-s3-cf-demo-hemanshu"
}


resource "aws_s3_object" "tf_s3_object" {
    bucket = aws_s3_bucket.tf_s3_bucket.bucket
    for_each = local.files_map
    key="${each.key}"
    source = "./public/${each.key}"
}

locals {
    files_list=fileset("./public","**")
    files_map = {for filea in local.files_list : filea => filea }
}

resource "aws_s3_bucket_website_configuration" "tf_s3_website" {
  bucket = aws_s3_bucket.tf_s3_bucket.bucket
  index_document {
    suffix = "index.html"
  }
  depends_on = [ aws_s3_bucket.tf_s3_bucket ]
}

resource "aws_s3_bucket_policy" "tf_s3_bucket_policy" {
   bucket = aws_s3_bucket.tf_s3_bucket.bucket
   policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
            {
                "Sid": "Statement1",
                "Effect": "Allow",
                "Principal": {
                    "AWS" : "${data.aws_iam_user.admin.arn}",
                    "Service": "cloudfront.amazonaws.com"              
                },
                "Action": [
                    "s3:*"
                ],
                "Resource": "arn:aws:s3:::tf-s3-cf-demo-hemanshu/*"
            }
        ]
    }

   EOF
   depends_on = [ aws_s3_bucket.tf_s3_bucket ]
}

data "aws_iam_user" "admin" {
  user_name = "Administrator"
}

#ABCDEF TESTING ADDITION