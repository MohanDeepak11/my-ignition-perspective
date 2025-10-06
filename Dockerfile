# Use official Ignition image
FROM inductiveautomation/ignition:8.1.9

# Expose Perspective web port
EXPOSE 8088

# Optional: set writable data directory
ENV IGNITION_DATA_DIR=/var/lib/ignition/data

# Do NOT override ENTRYPOINT or CMD
# The official image starts Ignition automatically
