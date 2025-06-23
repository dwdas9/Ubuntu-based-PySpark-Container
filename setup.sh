#!/bin/bash

echo "🐳 Ubuntu-based PySpark Container Setup"
echo "======================================"
echo
echo "This repository contains 4 different PySpark Docker configurations:"
echo "1. Ubuntu PySpark (Recommended for beginners)"
echo "2. Debian with Downloaded Python (Manual compilation)"
echo "3. Debian with Virtual Environment (Production recommended)"
echo "4. Bitnami Spark Single-Node (Full Spark cluster)"
echo

# Create Docker network if it doesn't exist
if ! docker network ls | grep -q dasnet; then
    echo "📡 Creating Docker network 'dasnet'..."
    docker network create dasnet
    echo "✅ Network 'dasnet' created successfully!"
else
    echo "📡 Docker network 'dasnet' already exists."
fi

echo
echo "🚀 Quick Start Options:"
echo
echo "For Ubuntu PySpark (beginners):"
echo "  cd dockerfiles/ubuntu-pyspark && ./build-and-run.sh"
echo
echo "For Debian with venv (production):"
echo "  cd dockerfiles/debian-venv && ./build-and-run.sh"
echo
echo "For Bitnami Spark (full cluster):"
echo "  cd dockerfiles/bitnami-spark && ./build-and-run.sh"
echo
echo "For Debian with downloaded Python:"
echo "  cd dockerfiles/debian-downloaded-python && ./build-and-run.sh"
echo
echo "📚 Check individual README files in each dockerfiles/* directory for detailed instructions."
echo "🔐 All containers use: username 'dwdas', password 'Passw0rd'"
echo
echo "Happy coding! 🎉"
