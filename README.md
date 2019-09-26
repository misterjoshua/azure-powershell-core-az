# Azure Powershell Core with Az & AKS Binaries
This repository is the source for a docker image built from azuresdk/azure-powershell-core which includes working Az modules, kubectl, and helm.

## Running a script
You may run scripts by mounting the script files as volumes. For example:
`docker run --rm -it wheatstalk/azure-powershell-core-az:latest -v somepath:/sut -- pwsh /sut/script.ps1`

## Connect to Azure
If you're using this container image to orchestrate Azure, you may connect to Azure as a service principal. For example, given `$ClientId`, `$ClientSecret`, `$SubscriptionId`, and `$TenantId`, the following lines in a script file will provide an authenticated powershell session:

```
$secureClientSecret = ConvertTo-SecureString $ClientSecret -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ($ClientId, $secureClientSecret)
Connect-AzAccount -ServicePrincipal -Credential $credentials -Subscription $SubscriptionId -Tenant $TenantId
# Test the Azure context.
Get-AzContext
```