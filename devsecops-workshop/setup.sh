#!/bin/bash

echo "Starting DevSecOps workshop setup..."

# Create working directory
mkdir -p /root/devsecops-workshop/jenkins-pipeline
cd /root/devsecops-workshop

# Copy the docker-compose.yml and Jenkinsfile (handled by index.json assets)
# Killercoda automatically copies files defined in index.json's "assets" to the target path.
# So, we just need to ensure the target directories exist.

echo "Files copied successfully."

# Start Docker Compose services in detached mode
echo "Starting Docker Compose services... This may take a few minutes."
docker-compose up -d

# Wait for Jenkins to be ready (optional, but good for stability)
# This is a basic check, a more robust check would look for a specific log message.
echo "Waiting for Jenkins to be up and running (might take 2-5 minutes)..."
until $(curl --output /dev/null --silent --head --fail http://localhost:8080); do
    printf '.'
    sleep 5
done
echo "Jenkins is up!"

# Wait for SonarQube to be ready
echo "Waiting for SonarQube to be up and running (might take a few minutes)..."
until $(curl --output /dev/null --silent --head --fail http://localhost:9001); do
    printf '.'
    sleep 5
done
echo "SonarQube is up!"

# Wait for ArcherySec to be ready
echo "Waiting for ArcherySec to be up and running (might take a few minutes)..."
until $(curl --output /dev/null --silent --head --fail http://localhost:8000); do
    printf '.'
    sleep 5
done
echo "ArcherySec is up!"

# Wait for Portainer to be ready
echo "Waiting for Portainer to be up and running (might take a few minutes)..."
until $(curl --output /dev/null --silent --head --fail http://localhost:9000); do
    printf '.'
    sleep 5
done
echo "Portainer is up!"

echo "All DevSecOps tools are starting. Continue with the instructions."

# Provide initial Jenkins admin password
echo "--- Jenkins Initial Admin Password ---"
docker compose logs jenkins | grep "Please use the following password to proceed to installation:"
echo "-------------------------------------"

echo "Setup complete! Navigate to the next step to configure Jenkins and run the pipeline."
