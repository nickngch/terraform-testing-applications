provider "aws" {
#  access_key = "ACCESS_KEY_HERE"
#  secret_key = "SECRET_KEY_HERE"
  region     = var.region
}

resource "aws_instance" "ubuntu" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key
  security_groups = [var.security_group]
  #count = "${length(var.azs)}"
  count = 1
  user_data = data.template_cloudinit_config.docker-cloudinit.rendered  

  root_block_device {
    volume_size = 30
  }
  
  tags = {
    Name = var.prefix
  }
}

output "ec2_address" {
  value = [aws_instance.ubuntu[*].public_ip]
}


data "template_cloudinit_config" "docker-cloudinit" {
  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.userdata_docker.rendered
  }
}

data "template_file" "userdata_docker" {
  template = file("files/userdata_docker")

  vars = {
   docker_version_server = 19.03
   user = var.user
   app = var.app
   dns = var.dns
  }
}

resource "aws_route53_record" "gitea" {
  zone_id = var.zone_id
  name    = "${var.gitea_subdomain}.${var.dns}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.ubuntu[0].public_ip]
}

resource "aws_route53_record" "minio" {
  zone_id = var.zone_id
  name    = "${var.minio_subdomain}.${var.dns}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.ubuntu[0].public_ip}"]
}

resource "aws_route53_record" "kibana" {
  zone_id = var.zone_id
  name    = "${var.kibana_subdomain}.${var.dns}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.ubuntu[0].public_ip}"]
}

resource "aws_route53_record" "elasticsearch" {
  zone_id = var.zone_id
  name    = "${var.elasticsearch_subdomain}.${var.dns}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.ubuntu[0].public_ip}"]
}

resource "aws_route53_record" "registry" {
  zone_id = var.zone_id
  name    = "${var.registry_subdomain}.${var.dns}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.ubuntu[0].public_ip}"]
}

