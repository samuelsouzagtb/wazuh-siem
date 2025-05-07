# Use a base image for Wazuh Manager
FROM wazuh/wazuh-manager:4.12.0

# Set environment variables if needed
ENV WAZUH_CONFIG=/var/ossec/etc/ossec.conf

# Copy custom configuration files (if any)
# COPY ./config/ossec.conf /var/ossec/etc/ossec.conf

# Corrected paths for SSL certificates
COPY ./certs/dashboard-key.pem /etc/wazuh-dashboard/certs/dashboard-key.pem
COPY ./certs/dashboard-cert.pem /etc/wazuh-dashboard/certs/dashboard-cert.pem

# Expose necessary ports
EXPOSE 1514 1515

# Start the Wazuh Manager
CMD ["/var/ossec/bin/ossec-control", "start"]
