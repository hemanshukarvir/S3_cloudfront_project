**Static Website Hosting with S3 + CloudFront using Terraform**

This project provisions a fully automated static website hosting setup on AWS using S3 for storage and CloudFront for global content delivery, all managed with Terraform.

**Features**
🗂️ Static website hosting via Amazon S3

🌍 Global content delivery using Amazon CloudFront

🔐 Optional public access block and secure bucket policies

⚙️ Infrastructure-as-code using Terraform

🧱 Clean module/file structure for clarity and reuse

**Project Structure**

├── public              # Static website Code

├── provider.tf         # AWS provider and region configuration

├── s3.tf               # S3 bucket and object definitions

├── cloudfront.tf       # CloudFront distribution setup

├── variables.tf        # (Optional) input variable definitions

├── outputs.tf          # (Optional) output values

└── README.md           # You're here

**Prerequisites**

Terraform
AWS CLI configured with sufficient IAM permissions
An S3-compatible static website (HTML/CSS/JS files) ready to upload

How to Use

1. 📥 Clone the Repo

git clone https://github.com/hemanshukarvir/S3_cloudfront_project
cd S3_cloudfront_project

3. 🔑 Configure AWS Credentials
Make sure your AWS CLI is configured or export your credentials manually:

aws configure

OR

export AWS_ACCESS_KEY_ID=your_key
export AWS_SECRET_ACCESS_KEY=your_secret

3. 📦 Initialize Terraform
terraform init

4. 🧪 Preview the Plan

terraform plan

5. 🚀 Apply the Configuration

terraform apply

🌐 Accessing the Website
Once deployed, access the CloudFront URL where your static site is hosted:

cloudfront_url = https://xxxxxxxxxxxx.cloudfront.net/index.html
