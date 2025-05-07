#!/bin/bash

# Create directories for certificates
mkdir -p wazuh/certs/indexer_cluster
mkdir -p wazuh/certs/dashboard_http

# Generate private key and certificate for Wazuh Indexer
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout wazuh/certs/indexer_cluster/indexer-key.pem \
  -out wazuh/certs/indexer_cluster/indexer-cert.pem \
  -subj "/CN=wazuh-indexer"

# Generate private key and certificate for Wazuh Dashboard
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout wazuh/certs/dashboard_http/dashboard-key.pem \
  -out wazuh/certs/dashboard_http/dashboard-cert.pem \
  -subj "/CN=wazuh-dashboard"

# Ensure all generated certificates have read permissions for all users
chmod -R 644 wazuh/certs/*


