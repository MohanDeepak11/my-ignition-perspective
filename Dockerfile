# Use the official Ignition image (full, not Alpine or slim)
FROM inductiveautomation/ignition:8.1.9

# Expose the Perspective web port
EXPOSE 8088

# Set Ignition data directory
# Railway volumes will map to this path for persistence
ENV IGNITION_DATA_DIR=/var/lib/ignition/data

# Set working directory
WORKDIR /var/lib/ignition

# Optional: copy your project files (if any)
# COPY ./projects /var/lib/ignition/data/projects

# Do NOT override ENTRYPOINT or CMD
# The official image already starts Ignition via tini
