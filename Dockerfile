FROM inductiveautomation/ignition:8.1.9

WORKDIR /usr/local/bin/ignition

# Copy the entire data folder
COPY ignition_data_copy/data /usr/local/bin/ignition/data

# Optional Java options
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xmx2g -Xms1g"

# Expose default port (can override with -p)
EXPOSE 8088

# Run Ignition in console mode and point to the conf directory
ENTRYPOINT ["./ignition-gateway", "-c", "./data/ignition.conf"]
