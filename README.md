# servian test https://github.com/servian/TechChallengeInstructions

## High level architecture:
- Azure subscription
   - Resource Group
       - AKS
           - pod
       - VNET
           - Postgres Subnet
           - AKS subnet
       - Postgres
           - database


## How to provision the solution:

### Pre-requisites:
1) Azure Subscription
2) Azure Service Principal https://docs.microsoft.com/en-us/powershell/azure/create-azure-service-principal-azureps?view=azps-7.5.0
3) Terraform Cloud free account
4) GitHub account with a repository
5) Permissions for created at stage 2 SPN "contributor" on the subscription level

### Steps to deploy the solutions:
1) Create TF cloud workspace
2) Connect TF cloud workspace with the GitHub repo
3) Add subscription and SPN details to TF cloud workspace variables so they can be used to access the Azure Subscription
    ARM_SUBSCRIPTION_ID
    ARM_CLIENT_SECRET
    ARM_TENANT_ID
    ARM_CLIENT_ID
4) Add PosgresSQL admin secret to workspace variables
5) Clone this repo
6) Start the TF Cloud provisioning
7) Fix errors if there are any


## What is not completed:
* AKS cluster provisioning
* Solution deployments to the cluster
* Postgres DB creation

## What could be improved
* Azure FrontDoor as a WAF
* More pods to run the solution
* NSGs to control traffic
* PostgresSQL granular access
* Postgres FW to allow connections only from AKS
* Provision KeyVault and store all the credentials in the KV
* Azure FW + Private endpoint for Postgres + AKS private cluster with private endpoint https://docs.microsoft.com/en-us/azure/aks/private-clusters
* Azure FrontDoor as a load balancer with multiple AKS clusters
* High availabililty for Flexible Postgresql 
  - https://docs.microsoft.com/en-us/azure/postgresql/flexible-server/concepts-high-availability
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server#high_availability 
  - setup maintenance windows when it suits https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server#maintenance_window
  - georedundant backups https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server#geo_redundant_backup_enabled
* Monitoring with Azure Monitor https://docs.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-enable-new-cluster#enable-using-terraform
* Postgres DB content might be encrypted if required
* AKS cluster autoscaling https://docs.microsoft.com/en-us/azure/aks/cluster-autoscaler
* Pipeline success - there should be a way to access via API or get a status picture published 
  - https://www.terraform.io/cloud-docs/api-docs/run
  - https://www.terraform.io/cloud-docs/workspaces/settings/notifications

 



