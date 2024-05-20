variable "name" {
  type    = string
  default = ""
}

variable "ami" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}

variable "key_name" {
  type    = string
  default = ""
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

variable "user_data_base64" {
  type    = string
  default = ""
}

variable "root_volume_size" {
  type    = string
  default = ""
}

variable "root_volume_type" {
  type    = string
  default = ""
}

variable "volume_encrypted" {
  type    = bool
  default = true
}

variable "kms_key_id" {
  type    = string
  default = "arn:aws:kms:ap-northeast-2:144149479695:key/8d753568-ea99-490b-b1d3-4aa401b6d044"
}
