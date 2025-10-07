FROM inductiveautomation/ignition:8.1.9

# Copy your Ignition data
COPY ignition_data_copy /usr/local/bin/ignition/data

# Optional: Java memory tuning
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xmx2g -Xms1g"

# Railway assigns a dynamic port
ENV GATEWAY_HTTP_PORT=$PORT
EXPOSE $PORT

# ✅ Run Ignition in console mode so it stays active
ENTRYPOINT ["./ignition-gateway", "-c"]
