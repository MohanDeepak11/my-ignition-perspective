# ----------------------------------------
# Railway-ready Dockerfile for Ignition Perspective
# Using official Ignition Alpine image
# ----------------------------------------

# Use the lightweight Alpine-based Ignition image
FROM inductiveautomation/ignition:8.1.9-alpine

# Set working directory (Ignition handles internal paths)
WORKDIR /var/lib/ignition

# Expose Perspective web port
EXPOSE 8088

# Optional: set environment variable for writable data folder
ENV IGNITION_DATA_DIR=/var/lib/ignition/data

# The Alpine image handles entrypoint and Tini internally
# No need to specify CMD, the container starts Ignition automatically
