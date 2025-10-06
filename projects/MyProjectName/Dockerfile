# ------------------------------
# Ignition Perspective Container
# ------------------------------

# Use the official Inductive Automation Ignition image
FROM inductiveautomation/ignition:latest

# Set default environment variables (optional)
ENV GATEWAY_ADMIN_PASSWORD=password \
    ACCEPT_IGNITION_EULA=Y \
    IGNITION_EDITION=full \
    GATEWAY_NAME=perspective-container

# Copy your Ignition project into the container (if exporting a gwbk)
# COPY ./backups/myproject.gwbk /usr/local/bin/

# Expose default Ignition ports
EXPOSE 8088 8043 8060

# Default startup command
CMD ["/usr/local/bin/ignition/ignition.sh", "run"]
