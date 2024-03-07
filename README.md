# az-terra
This will create AKS infra with required VNet and subnets also Application gateway. The resource id will be printed as an output for every resources defined.

**Prerequisite:** <br>
Install the Terraform v0.14.8 or above (https://www.terraform.io/) 
Make sure have the Azure subscription 

To initialise the provider plugins and etc
```
terraform init
```

To run the dry run of your infra
```
terraform plan
```

This is the actual run which will apply the change to your Infrastructure.
```
terraform apply
```


To cleanup evertyhing, just run the below command which will destroy all the resouces which is created as part of this code.
```
terraform destroy
```

# Upcoming Plan
* Will add the application deployment with simple application on the aks.
* Enable Blue Green
* 
