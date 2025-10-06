# ----------------------------------------
# Railway-ready Dockerfile for Ignition Perspective
# Using official Inductive Automation Docker image
# ----------------------------------------

# Use official Ignition image (replace version if needed)
FROM inductiveautomation/ignition:8.1.9

# Set working directory (Ignition already handles internal paths)
WORKDIR /var/lib/ignition

# Expose Perspective web port
EXPOSE 8088

# Optional: set environment variable for writable data folder
ENV IGNITION_DATA_DIR=/var/lib/ignition/data

# The official image already starts Ignition by default
# CMD is already handled in the base image
