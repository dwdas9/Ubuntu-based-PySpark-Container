# Debian PySpark Container (Downloaded Python)

This Docker container provides Debian with manually compiled Python 3.11.9, OpenJDK 17, and PySpark. This approach avoids the "externally-managed-environment" restrictions.

## Prerequisites

The build script will automatically download Python 3.11.9 if it's not present, or you can manually download it:
- Download Python 3.11.9 from [https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz](https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz)

## Quick Start

1. Build and run the container:
   ```bash
   chmod +x build-and-run.sh
   ./build-and-run.sh
   ```

2. Or manually:
   ```bash
   # Download Python if needed
   wget https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz
   
   # Build and run
   docker build -t my-debian-pyspark .
   docker run -it --name my-debian-pyspark-container my-debian-pyspark
   ```

## Container Details

| Category | Details |
|----------|---------|
| **Base Image** | Debian (latest) |
| **Python Version** | Python 3.11.9 (manually compiled) |
| **Java Version** | OpenJDK 17 |
| **PySpark Version** | Latest via pip |
| **Environment Variables** | `JAVA_HOME`: `/usr/lib/jvm/java-17-openjdk-amd64`, `PYTHONPATH`: `/usr/local/lib/python3.11/dist-packages`, `PYSPARK_PYTHON`: `/usr/local/bin/python3.11`, `PATH`: `$PATH:$JAVA_HOME/bin` |
| **Installed Packages** | Build tools (curl, wget, tar, etc.), Python 3.11.9 (source), OpenJDK 17, PySpark (pip) |
| **User Configuration** | Root user & `dwdas` (password: `Passw0rd`, sudo access) |
| **Exposed Port** | 8888 (for Jupyter) |
| **Default Command** | Bash shell start |

## Credentials
- Root password: `Passw0rd`
- User `dwdas` password: `Passw0rd`
