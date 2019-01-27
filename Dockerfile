FROM alpine:3.8

RUN apk add --no-cache bash git curl unzip

SHELL ["/bin/bash", "-c"]

#Versions
ENV TERRAFORM_VERSION 0.11.11
ENV TERRAFORM_DOCS_VERSION 0.6.0
ENV GIT_CHGLOG_VERSION 0.7.1

#Install Terraform
RUN curl -L -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /tmp/ && \
    mv /tmp/terraform /usr/local/bin/terraform && \
    chmod +x /usr/local/bin/terraform && \
    rm -rf /tmp/terraform.zip

#Install terraform-docs
RUN curl -L -o /tmp/terraform-docs https://github.com/segmentio/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64 && \
    mv /tmp/terraform-docs /usr/local/bin/terraform-docs && \
    chmod +x /usr/local/bin/terraform-docs

#Install git-chglog
RUN curl -L -o /tmp/git-chglog https://github.com/git-chglog/git-chglog/releases/download/${GIT_CHGLOG_VERSION}/git-chglog_linux_amd64 && \
    mv /tmp/git-chglog /usr/local/bin/git-chglog && \
    chmod +x /usr/local/bin/git-chglog

#Make mounts
RUN mkdir /code

#Add tests
COPY run_tests.sh /run_tests.sh