# AzureResourceGroup


Configure Azure Credentials
To run Terraform with Azure, you'll need to provide credentials for authentication. This can be done by setting environment variables in GitHub Actions.

a. Create Azure Service Principal
Open Azure Cloud Shell or your local terminal.
Run the following command to create a service principal and save the output:
  az ad sp create-for-rbac --name "my-service-principal" --role Contributor --scopes /subscriptions/YOUR_SUBSCRIPTION_ID --sdk-auth
Replace YOUR_SUBSCRIPTION_ID with your Azure subscription ID. This command will output a JSON object containing the credentials needed.

b. Add Credentials to GitHub Secrets
Go to your GitHub repository.
Click on Settings > Secrets and variables > Actions > New repository secret.

Add the following secrets based on the JSON output from the previous step:

AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_SUBSCRIPTION_ID
AZURE_TENANT_ID
The JSON output will look like this:

json

{
  "clientId": "<client-id>",
  "clientSecret": "<client-secret>",
  "subscriptionId": "<subscription-id>",
  "tenantId": "<tenant-id>",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
Map these values to the GitHub Secrets accordingly.

c. Update terraform.yml to Use Secrets
Modify the terraform.yml to include the secrets as environment variables:

yaml
# terraform.yml

name: Terraform Azure Deployment

on:
  push:
    branches:
      - main

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Set up Terraform
      uses: hashicorp/setup-terraform@v1
      with:
        terraform_version: 1.0.11  # Replace with your desired Terraform version

    - name: Azure Login
      uses: azure/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIALS }}

    - name: Terraform Init
      run: terraform init

    - name: Terraform Plan
      run: terraform plan

    - name: Terraform Apply
      run: terraform apply -auto-approve

    - name: Terraform Show Outputs
      run: terraform show -json
      
Ensure you create a secret named AZURE_CREDENTIALS in your repository containing the JSON output from az ad sp create-for-rbac.
This configuration will enable GitHub Actions to authenticate with Azure using the service principal credentials and execute Terraform commands to create the specified resources.





