# Ubuntu-based PySpark Container

This repository contains multiple Docker configurations for setting up PySpark environments with different base images and Python installation methods.

## Available Configurations

### 1. Ubuntu PySpark Container
- **Base**: Ubuntu 20.04
- **Python**: 3.12 (via deadsnakes PPA)
- **Location**: `dockerfiles/ubuntu-pyspark/`

### 2. Debian with Downloaded Python
- **Base**: Debian (latest)
- **Python**: 3.11.9 (manually compiled)
- **Location**: `dockerfiles/debian-downloaded-python/`

### 3. Debian with Virtual Environment
- **Base**: Debian (latest)
- **Python**: 3.11 (via apt, with venv)
- **Location**: `dockerfiles/debian-venv/`

### 4. Bitnami Spark Single-Node
- **Base**: Bitnami Spark image
- **Features**: Complete Spark cluster (Master + Worker)
- **Location**: `dockerfiles/bitnami-spark/`

## Quick Start (For Busy People)

Choose one of the following options:

### Option 1: Ubuntu PySpark (Recommended for beginners)
```bash
cd dockerfiles/ubuntu-pyspark
chmod +x build-and-run.sh
./build-and-run.sh
```

### Option 2: Debian with venv (Recommended for production)
```bash
cd dockerfiles/debian-venv
chmod +x build-and-run.sh
./build-and-run.sh
```

### Option 3: Bitnami Spark (Full Spark cluster)
```bash
cd dockerfiles/bitnami-spark
chmod +x build-and-run.sh
./build-and-run.sh
```

## Repository Structure

```
├── dockerfiles/
│   ├── ubuntu-pyspark/
│   │   ├── Dockerfile
│   │   ├── build-and-run.sh
│   │   └── README.md
│   ├── debian-downloaded-python/
│   │   ├── Dockerfile
│   │   ├── build-and-run.sh
│   │   └── README.md
│   ├── debian-venv/
│   │   ├── Dockerfile
│   │   ├── build-and-run.sh
│   │   └── README.md
│   └── bitnami-spark/
│       ├── Dockerfile
│       ├── build-and-run.sh
│       └── README.md
├── .gitignore
└── README.md
```

## Prerequisites

- Docker installed and running
- For Debian downloaded Python: Python 3.11.9 will be downloaded automatically
- Network named `dasnet` (or modify the scripts to use default network)

### Create Docker Network (Optional)
```bash
docker network create dasnet
```

## Common Credentials

All containers use the same credentials:
- **Root password**: `Passw0rd`
- **User `dwdas` password**: `Passw0rd`

## Detailed Documentation

Each configuration has its own detailed README with specific instructions:

- [Ubuntu PySpark](dockerfiles/ubuntu-pyspark/README.md)
- [Debian Downloaded Python](dockerfiles/debian-downloaded-python/README.md)
- [Debian Virtual Environment](dockerfiles/debian-venv/README.md)
- [Bitnami Spark](dockerfiles/bitnami-spark/README.md)

## Ubuntu PySpark Container Details

This configuration uses Ubuntu 20.04 as the base image to avoid "externally-managed-environment" restrictions.

### Features
- Ubuntu 20.04 base image
- Python 3.12 via deadsnakes PPA
- OpenJDK 17 via openjdk-r PPA
- PySpark via pip
- User `dwdas` with sudo privileges
- Exposed port 8888 for Jupyter

### Container Specifications

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

## Debian with Downloaded Python Details

This configuration manually compiles Python 3.11.9 to avoid package management restrictions.

### Features
- Debian latest base image
- Python 3.11.9 compiled from source
- OpenJDK 17
- PySpark via pip
- Build tools included

### Container Specifications

| Category | Details |
|----------|---------|
| **Base Image** | Debian (latest) |
| **Python Version** | Python 3.11.9 (manually compiled) |
| **Java Version** | OpenJDK 17 |
| **PySpark Version** | Latest via pip |
| **Environment Variables** | `JAVA_HOME`: `/usr/lib/jvm/java-17-openjdk-amd64`, `PYTHONPATH`: `/usr/local/lib/python3.11/dist-packages`, `PYSPARK_PYTHON`: `/usr/local/bin/python3.11` |
| **Installed Packages** | Build tools, Python 3.11.9 (source), OpenJDK 17, PySpark |

## Debian with Virtual Environment Details

This configuration uses the recommended virtual environment approach for newer Debian versions.

### Features
- Debian latest base image
- Python 3.11 via apt
- Virtual environment at `/opt/venv`
- PySpark installed in venv
- Clean separation of dependencies

### Container Specifications

| Category | Details |
|----------|---------|
| **Base Image** | Debian (latest) |
| **Python Version** | Python 3.11.9 |
| **Java Version** | OpenJDK 17 |
| **PySpark Version** | Installed via pip in virtual environment |
| **Virtual Environment** | Created with `python3.11 -m venv /opt/venv` |
| **Environment Variables** | `JAVA_HOME`: `/usr/lib/jvm/java-17-openjdk-amd64`, `PYTHONPATH`: `/opt/venv/lib/python3.11/site-packages`, `PYSPARK_PYTHON`: `/opt/venv/bin/python` |

## Bitnami Spark Single-Node Details

This configuration uses the official Bitnami Spark image for a complete Spark cluster setup.

### Features
- Official Bitnami Spark 3.5.2 image
- Complete Spark cluster (Master + Worker)
- Configuration directory mapping
- VS Code Remote Containers support
- Web UI access

### Environment Details

| Component | Value |
|-----------|-------|
| **OS** | debian 12: bitnami/minideb:bookworm |
| **Python** | python-3.12.5-1: /opt/bitnami/python/bin/python |
| **PYTHONPATH** | /opt/bitnami/spark/python/ |
| **Java** | java-17.0.12-10-1: JAVA_HOME = /opt/bitnami/java |
| **SPARK_HOME** | /opt/bitnami/spark |
| **SPARK_USER** | spark |
| **SPARK JARS Location** | /opt/bitnami/spark/jars |
| **Exposed Ports** | 4040 (Worker UI), 7077 (Master), 8080 (Master UI) |

### Access URLs
- **Spark Master UI**: http://localhost:8080
- **Spark Worker UI**: http://localhost:4040

## Troubleshooting

### Common Issues

#### Package Not Found (404 Not Found)
When building Docker images, you might encounter package not found errors. Solutions:

1. **Update Package Lists**: Ensure `apt-get update` runs before package installation
2. **Add Correct PPAs**: Use deadsnakes for Python and openjdk-r for OpenJDK
3. **Use Specific Versions**: Try slightly older but stable versions if latest isn't available

#### Network Issues
If containers can't communicate:
```bash
# Create the dasnet network
docker network create dasnet

# Or modify scripts to use default bridge network
```

#### Permission Issues
All containers include a user `dwdas` with sudo privileges:
- Username: `dwdas`
- Password: `Passw0rd`
- Root password: `Passw0rd`

## Contributing

1. Fork the repository
2. Create your feature branch
3. Make your changes
4. Test your Docker configurations
5. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).
