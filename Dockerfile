# Base image with Java 11
FROM openjdk:11-jre-slim

# Working directory
WORKDIR /opt/ignition

# Copy Ignition files
COPY ./ignition-installer /opt/ignition

# Expose Perspective port
EXPOSE 8088

# Run Ignition
CMD ["java", "-jar", "ignition.jar", "gateway"]
