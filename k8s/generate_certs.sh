#!/bin/bash

# Create directories for certificates
mkdir -p wazuh/certs/indexer_cluster
mkdir -p wazuh/certs/dashboard_http

# Generate root CA for Indexer
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout wazuh/certs/indexer_cluster/root-ca-key.pem \
  -out wazuh/certs/indexer_cluster/root-ca.pem \
  -subj "/CN=Root-CA"

# Generate node certificate for Indexer
openssl req -new -nodes -newkey rsa:2048 \
  -keyout wazuh/certs/indexer_cluster/node-key.pem \
  -out wazuh/certs/indexer_cluster/node.csr \
  -subj "/CN=Node"
openssl x509 -req -days 365 -in wazuh/certs/indexer_cluster/node.csr \
  -CA wazuh/certs/indexer_cluster/root-ca.pem \
  -CAkey wazuh/certs/indexer_cluster/root-ca-key.pem \
  -set_serial 01 -out wazuh/certs/indexer_cluster/node.pem

# Generate admin certificate for Indexer
openssl req -new -nodes -newkey rsa:2048 \
  -keyout wazuh/certs/indexer_cluster/admin-key.pem \
  -out wazuh/certs/indexer_cluster/admin.csr \
  -subj "/CN=Admin"
openssl x509 -req -days 365 -in wazuh/certs/indexer_cluster/admin.csr \
  -CA wazuh/certs/indexer_cluster/root-ca.pem \
  -CAkey wazuh/certs/indexer_cluster/root-ca-key.pem \
  -set_serial 02 -out wazuh/certs/indexer_cluster/admin.pem

# Generate filebeat certificate for Indexer
openssl req -new -nodes -newkey rsa:2048 \
  -keyout wazuh/certs/indexer_cluster/filebeat-key.pem \
  -out wazuh/certs/indexer_cluster/filebeat.csr \
  -subj "/CN=Filebeat"
openssl x509 -req -days 365 -in wazuh/certs/indexer_cluster/filebeat.csr \
  -CA wazuh/certs/indexer_cluster/root-ca.pem \
  -CAkey wazuh/certs/indexer_cluster/root-ca-key.pem \
  -set_serial 03 -out wazuh/certs/indexer_cluster/filebeat.pem

# Generate dashboard certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout wazuh/certs/dashboard_http/key.pem \
  -out wazuh/certs/dashboard_http/cert.pem \
  -subj "/CN=Wazuh-Dashboard"

# Ensure all generated certificates have read permissions for all users
chmod -R 644 wazuh/certs/*


