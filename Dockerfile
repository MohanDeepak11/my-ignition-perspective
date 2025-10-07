FROM inductiveautomation/ignition:8.1.9

# Copy your gateway data into the image
COPY ignition_data_copy /usr/local/bin/ignition/data

# Optional JVM tuning
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xmx2g -Xms1g"

# Railway uses $PORT dynamically
ENV GATEWAY_HTTP_PORT=${PORT:-8088}
EXPOSE ${PORT:-8088}

# Correct way to start Ignition Gateway in console mode
ENTRYPOINT ["/usr/local/bin/ignition/ignition-gateway", "ignition.conf", "wrapper.console.force=true"]
