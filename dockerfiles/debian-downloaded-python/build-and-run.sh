#!/bin/bash

# Check if Python-3.11.9.tgz exists
if [ ! -f "Python-3.11.9.tgz" ]; then
    echo "Downloading Python 3.11.9..."
    wget https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz
fi

echo "Building Debian PySpark (Downloaded Python) Docker image..."
docker build -t my-debian-pyspark .
echo "Debian PySpark image built successfully!"

echo "Running Debian PySpark container..."
docker run -it --name my-debian-pyspark-container my-debian-pyspark

echo "Container created and started!"
