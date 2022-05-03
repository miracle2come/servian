variable "ARM_CLIENT_ID" {
  type = string
}
variable "ARM_CLIENT_SECRET" {
  type = string
  sensitive = true
}
variable "ARM_SUBSCRIPTION_ID" {
  type = string
}
variable "ARM_TENANT_ID" {
  type = string
}
variable "pgsql_admin_secret" {
  type = string
  sensitive = true
}