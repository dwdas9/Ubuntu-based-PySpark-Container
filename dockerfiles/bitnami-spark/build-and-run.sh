#!/bin/bash

# Create local configuration directory if it doesn't exist
mkdir -p local-spark-conf

echo "Building Bitnami Spark single-node Docker image..."
docker build -t bitnami-spark-single-node .
echo "Bitnami Spark image built successfully!"

echo "Running Bitnami Spark container with configuration mapping..."
docker run -d --network dasnet --name bitnami-spark-single-node -p 4040:4040 -p 8080:8080 -p 7077:7077 -v ./local-spark-conf:/opt/spark/conf bitnami-spark-single-node

echo "Container created and started!"
echo "Spark Master UI: http://localhost:8080"
echo "Spark Worker UI: http://localhost:4040"
