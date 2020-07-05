variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = ""
}

variable "subnet_cidr" {
  default = ""
}
 
variable "security_group" {
  default = "Nick-testing-sg"
} 

variable "azs" {
  type = list
  default = ["us-east-2a","us-east-2b","us-east-2c"]
}

variable "prefix" {
  default = "Nick-testing-application"
}

variable "app" {
  default = "1"
}

variable "user" {
  default = "ubuntu"
}

variable "key" {
  default = "NickNg"
}

variable "ami" {
  default = "ami-0d5d9d301c853a04a"
}

variable "instance_type" {
  default = "t3a.large"
}

variable "zone_id" {
  default = ""
}

variable "dns" {
  default = "example.com"
}

variable "gitea_subdomain" {
  default = "gitea"
}

variable "minio_subdomain" {
  default = "minio"
}

variable "kibana_subdomain" {
  default = "kibana"
}

variable "elasticsearch_subdomain" {
  default = "elasticsearch"
}

variable "registry_subdomain" {
  default = "registry"
}
