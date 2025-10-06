docker run -d \
  --name ignition \
  -p 8088:8088 \       # HTTP
  -p 8043:8043 \       # HTTPS
  -p 8060:8060 \       # Metro SSL
  -v ignition_data:/usr/local/bin/ignition/data \   # Persist data & DB
  -e JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xmx2g -Xms1g" \  # Faster SecureRandom + more memory
  inductiveautomation/ignition:8.1.9
