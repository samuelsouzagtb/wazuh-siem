#!/bin/bash

# Create directory for certificates
mkdir -p certs

# Generate private key and certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout certs/dashboard-key.pem \
  -out certs/dashboard-cert.pem \
  -subj "/CN=wazuh-dashboard"