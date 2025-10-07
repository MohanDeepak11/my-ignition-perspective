<<<<<<< HEAD
FROM openjdk:11-jre-slim

# Install tini
RUN apt-get update && apt-get install -y tini && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/ignition

# Copy Ignition installer files
COPY ./ignition-installer /opt/ignition

# Set Ignition data directory
ENV IGNITION_DATA_DIR=/var/lib/ignition/data

# Expose Perspective port
EXPOSE 8088

# Start Ignition using tini
ENTRYPOINT ["/usr/bin/tini", "--", "./ignition-gateway"]
=======
# Use official Ignition image
FROM inductiveautomation/ignition:8.1.9

# Copy gateway data
COPY ignition_data_copy /usr/local/bin/ignition/data

# Optional Java options
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xmx2g -Xms1g"

# Use $PORT for Render HTTP
ENV GATEWAY_HTTP_PORT=$PORT
EXPOSE $PORT
>>>>>>> 062c06c (Save local changes before pull)
