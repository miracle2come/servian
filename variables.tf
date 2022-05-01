variable "ARM_CLIENT_ID" {
  type = string
}
variable "ARM_CLIENT_SECRET" {
  type = string
  sensitive = true
}
variable "ARM_SUBSDCRIPTION_ID" {
  type = string
}
variable "ARM_TENANT_ID" {
  type = string
}