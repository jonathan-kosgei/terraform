variable "ssh_key_thumbprint" { 
  description = "SSH key thumbprint for user jonathan"
  default= "E219928EDDE748FAA2F86210ABD02B0C5D6D9E36"
}
variable "ssh_key_path" { 
  description = "SSH key"
  default= "~/.ssh/azure.pfx"
}