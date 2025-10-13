FROM ubuntu:latest

# Install base dependencies
RUN apt-get update && apt-get install -y \
  curl \
  apt-transport-https \
  gnupg2 \
  jq \
  golang-go \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Create keyrings directory
RUN mkdir -p /etc/apt/keyrings

# Add Kubernetes repository
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
  chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list && \
  chmod 644 /etc/apt/sources.list.d/kubernetes.list

# Install kubectl
RUN apt-get update && \
  apt-get install -y kubectl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install Helm
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install Docker
RUN curl -sSL https://get.docker.com | sh

# Install crane
RUN go install github.com/google/go-containerregistry/cmd/crane@latest

ENV PATH="/root/go/bin:${PATH}"
