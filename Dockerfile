# Official Ignition image
FROM inductiveautomation/ignition:8.1.9

# Install tini to avoid "executable ./tini not found" errors
RUN apt-get update && apt-get install -y tini && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /var/lib/ignition

# Expose Perspective web port
EXPOSE 8088

# Environment variable for Ignition data folder
ENV IGNITION_DATA_DIR=/var/lib/ignition/data

# Use tini as init system for the container
ENTRYPOINT ["/usr/bin/tini", "--"]

# Default command to start Ignition
CMD ["./ignition-gateway"]
