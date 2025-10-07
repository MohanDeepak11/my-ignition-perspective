# Use official Ignition image
FROM inductiveautomation/ignition:8.1.9

# Copy gateway data if you have any (optional)
# COPY ignition_data_copy /usr/local/bin/ignition/data

# Set Java options (adjust memory if needed)
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xmx2g -Xms1g"

# Use $PORT for web access on Railway
ENV GATEWAY_HTTP_PORT=$PORT

# Expose Perspective port
EXPOSE $PORT
