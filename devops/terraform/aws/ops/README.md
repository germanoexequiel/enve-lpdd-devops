# Terraform files: La Pile Del Defe, ops environment

Deploy a new architecture for operations site

## Requirements

Requires `terraform` and `aws-cli` to be installed on your local machine 

## Which aws services are deployed

```
- 1 vpc
- 1 internet gtw
- 2 subnets
- 2 route tables
- 1 security group
- 1 t2-small instance type running ubuntu 18.04
```

## How to run the deployment services process
```
1 - once defined the architecture run terraform plan command to get a summary about what services are going to be deployed
2 - run terraform apply command to move forward with the aws deployment services and confirm typing yes to start the process 
```

## Author Information

DevOps guys.
