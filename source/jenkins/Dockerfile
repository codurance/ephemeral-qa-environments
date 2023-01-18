FROM jenkins/jenkins:2.384

USER root

# Install Terraform
RUN apt-get update && apt-get install -y gnupg software-properties-common
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com jammy main"
RUN apt-get update && apt-get install -y dnsutils terraform

# Install the Azure CLI
RUN curl -sLS https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/keyrings/microsoft.gpg > /dev/null && chmod go+r /etc/apt/keyrings/microsoft.gpg
RUN echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update && apt-get install -y azure-cli

USER jenkins
