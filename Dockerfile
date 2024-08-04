FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  curl apt-transport-https gnupg2 jq && \
  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
  chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list && \
  chmod 644 /etc/apt/sources.list.d/kubernetes.list && \
  curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null && \
  apt-get install apt-transport-https --yes && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
  apt-get update && \
  apt-get install -y kubectl helm && \
  apt-get clean && \
  curl -sSL https://get.docker.com | sh

ENTRYPOINT ["/bin/bash"]
