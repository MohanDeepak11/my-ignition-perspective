# Use a standard Java image
FROM openjdk:11-jre-slim

# Install tini
RUN apt-get update && \
    apt-get install -y tini && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/ignition

# Copy Ignition installer or your prebuilt files
COPY ./ignition-installer /opt/ignition

# Set Ignition data directory
ENV IGNITION_DATA_DIR=/var/lib/ignition/data

# Expose Perspective port
EXPOSE 8088

# Start Ignition using tini
ENTRYPOINT ["/usr/bin/tini", "--", "./ignition-gateway"]
