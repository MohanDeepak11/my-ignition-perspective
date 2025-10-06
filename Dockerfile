# ----------------------------------------
# Dockerfile for Ignition Perspective (Railway-ready)
# ----------------------------------------

# Use Java 11 base image (required by Ignition)
FROM openjdk:11-jre-slim

# Set working directory
WORKDIR /opt/ignition

# Install curl (needed to download Ignition)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Download Ignition Gateway JAR (replace URL with latest version if needed)
RUN curl -L -o ignition.jar "https://files.inductiveautomation.com/releases/8.1.9/ignition-gateway-8.1.9.jar"

# Create writable data folder for Ignition
RUN mkdir -p /opt/ignition/data

# Ensure permissions are correct for non-root user
RUN chown -R 1000:1000 /opt/ignition

# Run as non-root user (matches Railway free tier security)
USER 1000

# Expose Perspective web port
EXPOSE 8088

# Set environment variable so Ignition writes config files to writable folder
ENV IGNITION_DATA_DIR=/opt/ignition/data

# Start Ignition Gateway
CMD ["java", "-jar", "ignition.jar", "gateway"]
