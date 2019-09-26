FROM azuresdk/azure-powershell-core

ADD setup.ps1 /setup.ps1
RUN pwsh /setup.ps1