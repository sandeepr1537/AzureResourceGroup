# variables.tf

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "example-resources"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "australiaeast"
}
