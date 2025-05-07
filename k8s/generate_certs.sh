#!/bin/bash

# Create directories for certificates
mkdir -p k8s/certs/indexer
mkdir -p k8s/certs/manager
mkdir -p k8s/certs/dashboard


# Generate private key and certificate for Wazuh Indexer
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout k8s/certs/indexer/indexer-key.pem \
  -out k8s/certs/indexer/indexer-cert.pem \
  -subj "/CN=wazuh-indexer"

# Generate private key and certificate for Wazuh Manager
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout k8s/certs/manager/manager-key.pem \
  -out k8s/certs/manager/manager-cert.pem \
  -subj "/CN=wazuh-manager"

# Generate private key and certificate for Wazuh Dashboard
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout k8s/certs/dashboard/dashboard-key.pem \
  -out k8s/certs/dashboard/dashboard-cert.pem \
  -subj "/CN=wazuh-dashboard"
