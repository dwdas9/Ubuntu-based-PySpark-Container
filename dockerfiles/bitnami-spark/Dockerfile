# Use the official Bitnami Spark image as the base. I always pull a constant image and not :latest.
FROM bitnami/spark:3.5.2-debian-12-r2

# Step 1: Switch to root user to install software
# We need to be root to install utilities and set up sudo permissions.
USER root

# Step 2: Update the package list and install utilities. py4j and ipykernel is for VS studio connection.
# Install common utilities like sudo, ping, and nano.
# Update the base system
RUN apt-get update && \
    apt-get install -y sudo nano iputils-ping grep curl wget vim net-tools procps lsof telnet && \
    apt-get clean

# Install pip (if not already installed)
RUN apt-get install -y python3-pip

# Install py4j and ipykernel using pip. Required VS Code connection.
RUN pip3 install py4j ipykernel

# Step 3: Set the root user password to 'Passw0rd'
# This sets the root password to 'Passw0rd' for future access.
RUN echo "root:Passw0rd" | chpasswd

# Step 4: Give sudo privileges to the 'spark' user
# Here, we are allowing the 'spark' user to run commands as sudo without a password.
RUN echo "spark ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# After finishing the setup, we dont switch back to any user. The bitnami original Dockerfile switches to user 1001 and the directory is /opt/bitnami/spark

# Step 6: Expose necessary ports for Spark Web UI and communication
# 4040: Spark Worker Web UI
# 7077: Spark Master communication
# 8080: Spark Master Web UI
EXPOSE 4040 7077 8080

# End of the Dockerfile
