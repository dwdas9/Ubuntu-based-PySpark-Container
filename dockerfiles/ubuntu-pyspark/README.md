# Ubuntu PySpark Container

This Docker container provides Ubuntu 20.04 with Python 3.12, OpenJDK 17, and PySpark.

## Quick Start

1. Build and run the container:
   ```bash
   chmod +x build-and-run.sh
   ./build-and-run.sh
   ```

2. Or manually:
   ```bash
   docker build -t ubuntu-pyspark .
   docker run -it --name Ubuntu-PySpark --network dasnet ubuntu-pyspark
   ```

## Container Details

| Component | Details |
|-----------|---------|
| **Base Image** | `ubuntu:20.04` |
| **Python Version** | Python 3.12, installed via the `deadsnakes` PPA |
| **Java Version** | OpenJDK 17 (Headless), installed via the `openjdk-r` PPA |
| **PySpark Version** | Latest version of PySpark installed via pip |
| **Home Directory for User** | `/home/dwdas` |
| **User Created** | `dwdas` with sudo privileges and passwordless sudo access |
| **Exposed Port** | Port `8888`, commonly used for Jupyter Notebooks |
| **Default Command** | `bash` shell set as the default command |

## Credentials
- Root password: `Passw0rd`
- User `dwdas` password: `Passw0rd`
