# terraform rilvyk.com


DO_PAT var is the Personal Access Token from Digitalocean.


terraform plan -
```
terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa
```
terraform apply -

```
terraform apply -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa
```

This uses provider digital ocean to provision the following -
 - Load Balancer setup for use with provisioned http/nginx pods(port 80) + healthcheck(port 22)
 - Provisions two ubuntu 18.04 nginx hosts and deploys a single static website to both hosts.
 - Manages DNS records for rilvyk.com via Digitalocean

