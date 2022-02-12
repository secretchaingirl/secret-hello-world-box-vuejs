# Base image
FROM ubuntu:focal as runtime_base
# Add Rust env
FROM gitpod/workspace-rust
# Add node and npm env
FROM gitpod/workspace-node-lts

LABEL maintainer=secretchaingirllabs

# wasmi-sgx-test script requirements
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    #### Base utilities ####
    jq \
    openssl \
    curl \
    wget \
    bash-completion && \
    rm -rf /var/lib/apt/lists/*

RUN echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc

#RUN curl -sL https://deb.nodesource.com/setup_15.x | bash - && \
#    apt-get update && \
#    apt-get install -y nodejs npm


# Install ca-certificates
WORKDIR /root
