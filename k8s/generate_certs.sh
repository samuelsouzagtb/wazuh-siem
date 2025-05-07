#!/bin/bash

# Create directory for certificates
mkdir -p /etc/wazuh-dashboard/certs

# Generate private key and certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/wazuh-dashboard/certs/dashboard-key.pem \
  -out /etc/wazuh-dashboard/certs/dashboard-cert.pem \
  -subj "/CN=wazuh-dashboard"