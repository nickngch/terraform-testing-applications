# terraform-testing-applications
terraform file for setting up testing applications

## Pre-requisites:
- terraform 0.12.x

## How to use

### Quickstart
1. git clone
2. terraform init
3. update configuration in vars.tf
4. execute `terraform apply`

Change `app` variable in vars.tf to select which application to install
```
1: Gitea
2: Minio
3: Elasticsearch
4: Kibana
5: Registry
6: Elasticsearch + Kibana
```

Access the application with application.`DOMAIN NAME`, e.g.: minio.example.com
# terraform-testing-applications
