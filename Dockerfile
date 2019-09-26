FROM azuresdk/azure-powershell-core

ARG KUBECTL_VERSION
ENV KUBECTL_VERSION=1.16.0
ARG HELM_VERSION
ENV HELM_VERSION=2.14.3

ADD setup.ps1 /setup.ps1
RUN pwsh /setup.ps1