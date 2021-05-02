# Terraform files: La Pile Del Defe ops iam user and group

Deploy a new iam group and user to be used with aws s3 bucket.

## Requirements

Requires `terraform` and `aws-cli` to be installed on your local machine.
In the `Policys3bucket.json` file make sure to define the existing s3 bucket name in order to grant access to. 
The access keys are stored in `/opt/keys/lpdd-ops-access-key` file once created.

## Which aws services are deployed

```
- 1 iam group
- 1 iam user
- 1 iam user access keys
- 1 managed policy
- 1 policy attachment
```

## How to run the deployment services process
```
1 - once defined the architecture run terraform plan command to get a summary about what services are going to be deployed
2 - run terraform apply command to move forward with the aws deployment services and confirm typing yes to start the process 
```

## Author Information

DevOps guys
