# Use Ubuntu 20.04 as the base image to avoid "externally-managed-environment" restrictions
FROM ubuntu:20.04

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list to ensure we have the latest information about available packages
RUN apt-get update

# Install necessary packages including curl, sudo, and nano
RUN apt-get install -y curl sudo nano software-properties-common

# Add the 'deadsnakes' PPA (Personal Package Archive) to access newer Python versions
RUN add-apt-repository ppa:deadsnakes/ppa

# Add the OpenJDK PPA to get the latest JDK versions
RUN add-apt-repository ppa:openjdk-r/ppa

# Update the package list again to include the new PPAs
RUN apt-get update

# Install Python 3.12, pip, and OpenJDK 17
RUN apt-get install -y python3.12 python3-pip openjdk-17-jdk-headless

# Install the PySpark library using pip
RUN pip3 install pyspark

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
