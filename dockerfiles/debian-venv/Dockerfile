# Use the latest version of Debian as the base image
FROM debian:latest

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package lists and install essential packages
RUN apt-get update && \
    apt-get install -y curl wget tar bash ca-certificates sudo gnupg

# Install Python 3.11, venv, pip, and OpenJDK 17
RUN apt-get install -y python3.11 python3.11-venv python3.11-dev python3-pip openjdk-17-jdk-headless

# Create a virtual environment
RUN python3.11 -m venv /opt/venv

# Activate the virtual environment and install PySpark
RUN /opt/venv/bin/python -m pip install pyspark

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PYTHONPATH=/opt/venv/lib/python3.11/site-packages
ENV PYSPARK_PYTHON=/opt/venv/bin/python
ENV PATH=$PATH:$JAVA_HOME/bin:/opt/venv/bin

# Clean up the package lists to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a root user and set its password
RUN echo 'root:Passw0rd' | chpasswd

# Create a new user 'dwdas', set a password, and add this user to the sudo group
RUN useradd -ms /bin/bash dwdas && echo 'dwdas:Passw0rd' | chpasswd && adduser dwdas sudo

# Allow the 'dwdas' user to run sudo commands without a password
RUN echo 'dwdas ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set the working directory to the home directory of the new user
WORKDIR /home/dwdas

# Switch to the new user 'dwdas'
USER dwdas

# Expose port 8888, commonly used for Jupyter Notebook, if needed
EXPOSE 8888

# Set the default command to start a bash shell
CMD ["bash"]
