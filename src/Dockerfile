# Use a base image for Wazuh Manager
FROM wazuh/wazuh-manager:latest

# Set environment variables if needed
ENV WAZUH_CONFIG=/var/ossec/etc/ossec.conf

# Copy custom configuration files (if any)
# COPY ./config/ossec.conf /var/ossec/etc/ossec.conf

# Expose necessary ports
EXPOSE 1514 1515

# Start the Wazuh Manager
CMD ["/var/ossec/bin/ossec-control", "start"]