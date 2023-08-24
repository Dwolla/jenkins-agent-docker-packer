ARG PYTHON_TAG
FROM --platform=$TARGETPLATFORM dwolla/jenkins-agent-python:${PYTHON_TAG}
ARG TARGETARCH
ENV PACKER_VERSION=1.8.7
LABEL maintainer="Dwolla Dev <dev+jenkins-agent-python@dwolla.com>"
LABEL org.label-schema.vcs-url="https://github.com/Dwolla/jenkins-agent-docker-python"
USER root

# Install Packer
RUN apt-get update && apt-get install -y wget unzip \
    && wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_${TARGETARCH}.zip \
    && unzip packer_${PACKER_VERSION}_linux_${TARGETARCH}.zip \
    && mv packer /usr/local/bin/ \
    && rm packer_${PACKER_VERSION}_linux_${TARGETARCH}.zip

USER jenkins
