# Azure Powershell Core with Az & AKS Binaries
This is the code for a Docker image built from `azuresdk/azure-powershell-core` which includes working `Az.*` Powershell modules, `kubectl`, and `helm`. This image can be used to test Azure-controlling Powershell scripts, especially those that combine ARM with Azure Kubernetes Service boilerplate. (Hence kubectl and helm.)

## Running a script
You may run scripts by mounting the script files as volumes. For example:
```
docker run --rm -it wheatstalk/azure-powershell-core-az:latest -v somepath:/sut -- pwsh /sut/script.ps1
```

## Connect to Azure
You may connect to Azure as a service principal with this image. For example, given `$ClientId`, `$ClientSecret`, `$SubscriptionId`, and `$TenantId`, the following lines in a script file will provide an authenticated Powershell session:

```
$secureClientSecret = ConvertTo-SecureString $ClientSecret -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ($ClientId, $secureClientSecret)
Connect-AzAccount -ServicePrincipal -Credential $credentials -Subscription $SubscriptionId -Tenant $TenantId

# Test the Azure context.
Get-AzContext
```