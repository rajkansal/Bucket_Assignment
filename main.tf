

provider "aws" {
  region = "us-east-1"  // Replace with your desired region
}

# variable "bucket_prefix" {
#   default = "my-bucket-0123"
# }

# resource "aws_s3_bucket" "bucket" {
#   count = 3

#   bucket = "${var.bucket_prefix}${count.index}"
  

#   # Optional: Configure other bucket properties
# }

# variable "bucket_names" {
#   type = list(string)
#   default = ["fvhdbdyufghdv", "fdvbdvhbhdfhcdv", "sdjbvuiebvjdbvuibv"]
# }

# resource "aws_s3_bucket" "bucket" {
#   for_each = toset(var.bucket_names)

#   bucket = each.value
  

#   # Optional: Configure other bucket properties
# }

variable "number_of_website_buckets" {
  type = number
  default = 3
}

resource "aws_s3_bucket" "website_bucket" {
  count = var.number_of_website_buckets

  bucket = "${var.number_of_website_buckets}-website-${count.index}"  # Optional bucket prefix
  
}


variable "website_bucket_names" {
  type = map(string)
  default = {
    "marketing" = "fedbfuivbdjvbuih"
    "product"   = "fkwjenfienvjguvrgi"
    "blog"      = "fuhfufhughghhguifg"
  }
}


resource "aws_s3_bucket" "website_bucket" {
  for_each = var.website_bucket_names

  bucket = each.value
  
}

