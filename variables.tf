variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "ecr_values" {
  type        = any
  default     = {}
  description = "AWS ECR configuration"
}

variable "ecs_values" {
  type        = any
  default     = {}
  description = "AWS ECS configuration"
}

variable "lb_values" {
  type        = any
  default     = {}
  description = "AWS Load Balancer configuration"
}

variable "vpc" {
  type        = any
  default     = {}
  description = "AWS VPC configuration"
}

variable "container" {
  type        = any
  default     = {}
  description = "Container configuration to deploy"
}


# variable "aws_region" {
#   default     = "us-east-1"
#   description = "aws region where our resources going to create choose"
#   #replace the region as suits for your requirement
# }

variable "az_count" {
  default     = "2"
  description = "number of availability zones in above region"
}

variable "access_port" {
  default     = "80"
  description = "number of availability zones in above region"
}

variable "app_port" {
  default     = "8080"
  description = "number of availability zones in above region"
}



# variable "ecs_task_execution_role" {
#   default     = "myECcsTaskExecutionRole"
#   description = "ECS task execution role name"
# }

# variable "app_image" {
#   default     = "eyalh054/test-app:latest"
#   description = "docker image to run in this ECS cluster"
# }

# variable "app_port" {
#   default     = "8080"
#   description = "portexposed on the docker image"
# }

# variable "access_port" {
#   default     = "80"
#   description = "portexposed on the docker image"
# }


# variable "app_count" {
#   default     = "2" #choose 2 bcz i have choosen 2 AZ
#   description = "numer of docker containers to run"
# }

# variable "health_check_path" {
#   default = "/"
# }

# variable "fargate_cpu" {
#   default     = "1024"
#   description = "fargate instacne CPU units to provision,my requirent 1 vcpu so gave 1024"
# }

# variable "fargate_memory" {
#   default     = "2048"
#   description = "Fargate instance memory to provision (in MiB) not MB"
# }
