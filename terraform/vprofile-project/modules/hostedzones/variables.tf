variable "vpc_id" {}

variable "db_private_ip" {}

variable "rabbitmq_private_ip" {}

variable "memcached_private_ip" {}

variable "webapp_private_ip" {}

variable "tags" {
  type = map(string)
  default = {
    Name        = "vprofile-hostedzones"
    Project     = "vprofile-project"
    Environment = "dev"
  }
}
