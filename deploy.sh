#!/bin/bash

# Step 1: Maven build
mvn clean package

# Step 2: Build Docker image
docker build -t student-webapp:latest .

# Step 3: Stop & remove old container if exists
docker stop student-webapp-container || true
docker rm student-webapp-container || true

# Step 4: Run new container on port 8081
docker run -d -p 8081:8080 --name student-webapp-container student-webapp:latest

echo "Deployment finished! Open http://localhost:8081/student-webapp"
