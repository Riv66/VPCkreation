
# Design paramaters
variable "vpcname" {
  description = "Enter VPC Name:"
}

variable "vpccdir" {
  description = "Enter VPC CDIR:"
}

variable "pubsub" {
  type        = map(any)
  description = "Enter VPC Name & CDIR:"
}

variable "prisub" {
  type        = map(any)
  description = "Enter VPC Name &  CDIR:"
}

variable "tags" {
  type        = map(any)
  description = "Enter Resource Tags:"
}

variable "keyp" {
  description = "Enter EC2 Key Pair Name:"

}
