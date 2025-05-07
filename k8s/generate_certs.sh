#!/bin/bash

# Create directory for certificates
mkdir -p k8s/certs

# Generate private key and certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout k8s/certs/dashboard-key.pem \
  -out k8s/certs/dashboard-cert.pem \
  -subj "/CN=wazuh-dashboard"