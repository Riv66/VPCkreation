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

variable "mod-azs" {
  description = "Enter EC2 Key Pair Name:"
type = number
}

variable "mod-region" {
  description = "Enter Region:"
type = string
}

