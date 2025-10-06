# 1. Start from Java 11 base image
FROM openjdk:11-jre-slim

# 2. Set working directory inside container
WORKDIR /opt/ignition

# 3. Copy Ignition files into this folder
COPY ./ignition-installer /opt/ignition

# 4. Create a writable data folder
RUN mkdir -p /opt/ignition/data

# 5. Tell Ignition to use this writable folder for configs
ENV IGNITION_DATA_DIR=/opt/ignition/data

# 6. Expose Perspective port
EXPOSE 8088

# 7. Run Ignition
CMD ["java", "-jar", "ignition.jar", "gateway"]
