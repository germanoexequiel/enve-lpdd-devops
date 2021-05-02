# Terraform files: La Pile Del Defe ops vpc peering connection 

Deploy a vpc peering connection between `ops vpc` which is the requester side and `dev vpc` which is the accepter side

## Requirements

Requires `terraform` and `aws-cli` to be installed on your local machine 

## Which aws services are deployed

```
- 1 vpc peering connection
```

## How to run the deployment services process
```
1 - once defined the architecture run terraform plan command to get a summary about what services are going to be deployed
2 - run terraform apply command to move forward with the aws deployment services and confirm typing yes to start the process 
```

## Author Information

DevOps guys
