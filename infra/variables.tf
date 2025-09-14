variable "aws_region" {
  default = "eu-north-1"
}

variable "app_name" {
  default = "devops-task"
}

variable "app_image" {
  description = "Docker image for ECS task"
  default     = "harshpatel04/devops-task:latest"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  default = ["eu-north-1a", "eu-north-1b"]
}
