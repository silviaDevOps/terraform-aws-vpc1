# Create a VPC
resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_subnets" {
  depends_on = [ # Explicit dependency 
    aws_vpc.example
  ]

  vpc_id            = aws_vpc.example.id # Implicit dependency
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

}

resource "aws_iam_user" "lb" {
    for_each = toset(var.users)
    name = each.value
    tags = var.tags

}

output list_of_users {
    value = <<EOF


        Today you have created the following users


                "${aws_iam_user.lb["bob1"].arn}"




    EOF
}