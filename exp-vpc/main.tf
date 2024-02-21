# Define the main VPC with configurable CIDR block and DNS settings
resource "aws_vpc" "vpc" {
    cidr_block           = var.vpc-cidr  # CIDR block for the VPC
    instance_tenancy     = "default"  # VPC instance tenancy setting
    enable_dns_hostnames = true  # Enable DNS hostname resolution
    enable_dns_support   = true  # Enable DNS support
    tags = {
        Name          = var.vpc-name  # Name tag for the VPC
    }
}

# Create public subnets across specified availability zones
resource "aws_subnet" "public-subnets" {
    for_each          = var.public_subnet_numbers  # Iterate over provided subnet definitions
    vpc_id            = aws_vpc.vpc.id  # Associate with created VPC
    availability_zone = each.key  # AZ for the subnet
    cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)  # Calculate CIDR block for the subnet
    tags = merge(
        {
            "Name"        = "${var.env}-${each.key}",  # Naming convention for subnets
            "environment" = var.env  # Environment tagging
        },
        var.k8s == true ? {"kubernetes.io/role/elb" = "1"} : {},  # Kubernetes-specific tags if applicable
        var.k8s == true ? {"kubernetes.io/cluster/${var.cluster-name}" = "shared"} : {}
    )
}

# Create private subnets in the same manner as public subnets
resource "aws_subnet" "private-subnets" {
    for_each          = var.private_subnet_numbers
    vpc_id            = aws_vpc.vpc.id
    availability_zone = each.key
    cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
    tags = merge(
        {
            "Name"        = "${var.env}-${each.key}",
            "environment" = var.env
        },
        var.k8s == true ? {"kubernetes.io/role/internal-elb" = "1"} : {},
        var.k8s == true ? {"kubernetes.io/cluster/${var.cluster-name}" = "shared"} : {}
    )
}

# Internet Gateway to allow public internet access to the VPC
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.vpc.id  # Associate with created VPC
    tags = {
        Name         = "${var.env}-igw",
        "environment"= var.env  # Environment tagging
    }
}

# Elastic IP for NAT Gateway - ensures internet access for private subnets
resource "aws_eip" "nat_gateway_eip" {
    vpc = true
    depends_on = [aws_internet_gateway.gw]  # Ensure IGW is created first
}

# NAT Gateway to provide internet access for instances in private subnets
resource "aws_nat_gateway" "nat-gateway" {
    allocation_id = aws_eip.nat_gateway_eip.id  # Associate with EIP
    subnet_id     = aws_subnet.public-subnets["us-east-1a"].id  # Place in a public subnet
    tags = {
      "environment" = var.env
    }
}

# Route table for public subnets - configures routes for internet access
resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "public-route-table"
    }
}

# Route table for private subnets - uses NAT Gateway for internet access
resource "aws_route_table" "private-route-table" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "private-route-table"
    }
}

# Default route for public subnets to the Internet Gateway
resource "aws_route" "default-public-route" {
    route_table_id         = aws_route_table.public-route-table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.gw.id
}

# Default route for private subnets through the NAT Gateway
resource "aws_route" "default-private-route" {
    route_table_id         = aws_route_table.private-route-table.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = aws_nat_gateway.nat-gateway.id
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public-route-association" {
    for_each = aws_subnet.public-subnets

    subnet_id      = each.value.id
    route_table_id = aws_route_table.public-route-table.id
}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private-route-association" {
    for_each = aws_subnet.private-subnets

    subnet_id      = each.value.id
    route_table_id = aws_route_table.private-route-table.id
}
