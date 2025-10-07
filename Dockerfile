# Use official Ignition image
FROM inductiveautomation/ignition:8.1.9

# Expose the Perspective web port
EXPOSE 8088

# Set environment variable for data directory
# Railway volumes will map to this path for persistence
ENV IGNITION_DATA_DIR=/var/lib/ignition/data

# Set working directory
WORKDIR /var/lib/ignition

# Do NOT override ENTRYPOINT or CMD
# The official image will start Ignition automatically

# Optional: copy any project-specific files if needed
# COPY ./projects /var/lib/ignition/data/projects

# End of Dockerfile
