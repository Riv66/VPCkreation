variable "mod-pubsub" {
  description = "Var passed from root"
    type        = map(any)
}

variable "mod-prisub" {
  description = "Var passed from root"
    type        = map(any)
}

variable "mod-cdir" {
  description = "Var passed from root"
  type        = string
}
variable "mod-tags" {
  description = "Var passed from root"
    type        = map(any)
}

variable "mod-vpcname" {
  description = "Var passed from root"
    type        = string
}

variable "mod-region" {
  description = "Enter Region:"
type = string
}

variable "mod-az_count" {
  description = "The number of availability zones to use"
  type        = number
}

/*
variable "mod-public_subnet_count" {
  description = "The number of public subnets to create"
  type        = number
} 

variable "mod-private_subnet_count" {
  description = "The number of private subnets to create"
  type        = number
}