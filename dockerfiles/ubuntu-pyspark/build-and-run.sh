#!/bin/bash

echo "Building Ubuntu PySpark Docker image..."
docker build -t ubuntu-pyspark .
echo "Ubuntu PySpark image built successfully!"

echo "Running Ubuntu PySpark container..."
docker run -it --name Ubuntu-PySpark --network dasnet ubuntu-pyspark

echo "Container created and started!"
