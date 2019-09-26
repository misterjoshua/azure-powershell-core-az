FROM azuresdk/azure-powershell-core

ADD setup.ps1 /setup.ps1
RUN pwsh -Command "Invoke-WebRequest -Uri https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl -OutFile /usr/local/bin/kubectl" \
        && chmod +x /usr/local/bin/kubectl \
    && pwsh -Command "Invoke-WebRequest -Uri https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz -OutFile helm.tar.gz" \
        && tar -xzf helm.tar.gz \
        && cp linux-amd64/helm /usr/local/bin/ \
        && chmod +x /usr/local/bin/helm

RUN kubectl help
RUN helm help

RUN pwsh /setup.ps1