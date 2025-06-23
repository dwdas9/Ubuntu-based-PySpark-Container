# Debian PySpark Container (Virtual Environment)

This Docker container provides Debian with Python 3.11, OpenJDK 17, and PySpark using the recommended virtual environment approach.

## Quick Start

1. Build and run the container:
   ```bash
   chmod +x build-and-run.sh
   ./build-and-run.sh
   ```

2. Or manually:
   ```bash
   docker build -t my-debian-pyspark-venv .
   docker run -it --name my-debian-pyspark-venv-container my-debian-pyspark-venv
   ```

## Container Details

| Category | Details |
|----------|---------|
| **Base Image** | Debian (latest) |
| **Python Version** | Python 3.11.9 |
| **Java Version** | OpenJDK 17 |
| **PySpark Version** | Installed via pip in a virtual environment |
| **Virtual Environment** | Created with `python3.11 -m venv /opt/venv` |
| **Environment Variables** | `JAVA_HOME`: `/usr/lib/jvm/java-17-openjdk-amd64`, `PYTHONPATH`: `/opt/venv/lib/python3.11/site-packages`, `PYSPARK_PYTHON`: `/opt/venv/bin/python`, `PATH`: `$PATH:$JAVA_HOME/bin:/opt/venv/bin` |
| **Installed Packages** | Essential tools (curl, wget, tar, bash, etc.), Python 3.11, venv, pip, OpenJDK 17, PySpark (in venv) |
| **User Configuration** | Root user & `dwdas` (password: `Passw0rd`, sudo access) |
| **Exposed Port** | 8888 (for Jupyter) |
| **Default Command** | Bash shell start |

## Credentials
- Root password: `Passw0rd`
- User `dwdas` password: `Passw0rd`
