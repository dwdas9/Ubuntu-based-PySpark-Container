#!/bin/bash

echo "Building Debian PySpark (venv) Docker image..."
docker build -t my-debian-pyspark-venv .
echo "Debian PySpark (venv) image built successfully!"

echo "Running Debian PySpark (venv) container..."
docker run -it --name my-debian-pyspark-venv-container my-debian-pyspark-venv

echo "Container created and started!"
