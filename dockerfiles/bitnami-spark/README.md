# Bitnami Spark Single-Node Container

This Docker container uses the official Bitnami Spark image to set up a single-node Spark environment with both Master and Worker.

## Quick Start

1. Build and run the container:
   ```bash
   chmod +x build-and-run.sh
   ./build-and-run.sh
   ```

2. Or manually:
   ```bash
   # Create configuration directory
   mkdir -p local-spark-conf
   
   # Build and run
   docker build -t bitnami-spark-single-node .
   docker run -d --network dasnet --name bitnami-spark-single-node -p 4040:4040 -p 8080:8080 -p 7077:7077 -v ./local-spark-conf:/opt/spark/conf bitnami-spark-single-node
   ```

## Access URLs

- **Spark Master UI**: http://localhost:8080
- **Spark Worker UI**: http://localhost:4040

## Configuration

The `local-spark-conf` directory will be automatically created and mapped to `/opt/spark/conf` inside the container. You can place Spark configuration files here.

## Environment Details

| Component | Value |
|-----------|-------|
| **OS** | debian 12: bitnami/minideb:bookworm |
| **Python** | python-3.12.5-1: /opt/bitnami/python/bin/python |
| **PYTHONPATH** | /opt/bitnami/spark/python/ |
| **Java** | java-17.0.12-10-1: JAVA_HOME = /opt/bitnami/java |
| **JAVA_HOME** | /opt/bitnami/java |
| **SPARK_HOME** | /opt/bitnami/spark |
| **SPARK_USER** | spark |
| **SPARK JARS Location** | /opt/bitnami/spark/jars |
| **Workdir** | /opt/bitnami/spark |
| **User** | 1001 |
| **Entrypoint** | /opt/bitnami/scripts/spark/entrypoint.sh |
| **Command** | /opt/bitnami/scripts/spark/run.sh |

## Important Environment Variables

| Name | Description | Value |
|------|-------------|-------|
| **SPARK_BASE_DIR** | Spark installation directory | ${BITNAMI_ROOT_DIR}/spark |
| **SPARK_CONF_DIR** | Spark configuration directory | ${SPARK_BASE_DIR}/conf |
| **SPARK_DEFAULT_CONF_DIR** | Spark default configuration directory | ${SPARK_BASE_DIR}/conf.default |
| **SPARK_WORK_DIR** | Spark workspace directory | ${SPARK_BASE_DIR}/work |
| **SPARK_CONF_FILE** | Spark configuration file path | ${SPARK_CONF_DIR}/spark-defaults.conf |
| **SPARK_LOG_DIR** | Spark logs directory | ${SPARK_BASE_DIR}/logs |
| **SPARK_TMP_DIR** | Spark tmp directory | ${SPARK_BASE_DIR}/tmp |
| **SPARK_JARS_DIR** | Spark jar directory | ${SPARK_BASE_DIR}/jars |

## Credentials
- Root password: `Passw0rd`
- The container includes py4j and ipykernel for VS Code Remote Containers extension

## Logs
To view container logs:
```bash
docker logs bitnami-spark-single-node
```
