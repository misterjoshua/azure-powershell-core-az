$ErrorActionPreference = "Stop"

Invoke-WebRequest -Uri "https://storage.googleapis.com/kubernetes-release/release/v$env:KUBECTL_VERSION/bin/linux/amd64/kubectl" -OutFile /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl

Invoke-WebRequest -Uri https://get.helm.sh/helm-v$env:HELM_VERSION-linux-amd64.tar.gz -OutFile helm.tar.gz
tar -xzf helm.tar.gz
cp linux-amd64/helm /usr/local/bin/
chmod +x /usr/local/bin/helm

rm -rf /setup.ps1
rm -rf helm.tar.gz linux-amd64

kubectl help
helm help

Write-Host "Installing the Az modules"
Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force -Verbose