#!/bin/bash

# Create directories for certificates
mkdir -p certs/indexer_cluster
mkdir -p certs/dashboard_http

# Generate root CA for Indexer
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout certs/indexer_cluster/root-ca-key.pem \
  -out certs/indexer_cluster/root-ca.pem \
  -subj "/CN=Root-CA"

# Generate node certificate for Indexer
openssl req -new -nodes -newkey rsa:2048 \
  -keyout certs/indexer_cluster/node-key.pem \
  -out certs/indexer_cluster/node.csr \
  -subj "/CN=Node"
openssl x509 -req -days 365 -in certs/indexer_cluster/node.csr \
  -CA certs/indexer_cluster/root-ca.pem \
  -CAkey certs/indexer_cluster/root-ca-key.pem \
  -set_serial 01 -out certs/indexer_cluster/node.pem

# Generate admin certificate for Indexer
openssl req -new -nodes -newkey rsa:2048 \
  -keyout certs/indexer_cluster/admin-key.pem \
  -out certs/indexer_cluster/admin.csr \
  -subj "/CN=Admin"
openssl x509 -req -days 365 -in certs/indexer_cluster/admin.csr \
  -CA certs/indexer_cluster/root-ca.pem \
  -CAkey certs/indexer_cluster/root-ca-key.pem \
  -set_serial 02 -out certs/indexer_cluster/admin.pem

# Generate filebeat certificate for Indexer
openssl req -new -nodes -newkey rsa:2048 \
  -keyout certs/indexer_cluster/filebeat-key.pem \
  -out certs/indexer_cluster/filebeat.csr \
  -subj "/CN=Filebeat"
openssl x509 -req -days 365 -in certs/indexer_cluster/filebeat.csr \
  -CA certs/indexer_cluster/root-ca.pem \
  -CAkey certs/indexer_cluster/root-ca-key.pem \
  -set_serial 03 -out certs/indexer_cluster/filebeat.pem

# Generate dashboard certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout certs/dashboard_http/key.pem \
  -out certs/dashboard_http/cert.pem \
  -subj "/CN=Wazuh-Dashboard"

# Ensure all generated certificates have read permissions for all users
chmod -R 644 certs/*


