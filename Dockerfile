FROM mcr.microsoft.com/powershell

ARG KUBECTL_VERSION
ENV KUBECTL_VERSION=1.19.0
ARG HELM_VERSION
ENV HELM_VERSION=2.16.10
ARG HELM3_VERSION
ENV HELM3_VERSION=3.3.1

ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl
RUN kubectl help

WORKDIR /tmp/helm
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz helm.tar.gz
RUN tar -xzf helm.tar.gz \
  && cp linux-amd64/helm /usr/local/bin/helm \
  && chmod +x /usr/local/bin/helm
RUN helm help

WORKDIR /tmp/helm3
ADD https://get.helm.sh/helm-v${HELM3_VERSION}-linux-amd64.tar.gz helm3.tar.gz
RUN tar -xzf helm3.tar.gz \
  && cp linux-amd64/helm /usr/local/bin/helm3 \
  && chmod +x /usr/local/bin/helm3
RUN helm3 help

RUN pwsh -Command Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force -Verbose

RUN rm -rf /tmp/*

WORKDIR /sut
VOLUME ["/sut"]
