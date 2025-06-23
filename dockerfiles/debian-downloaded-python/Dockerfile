# Use Debian as the base image
FROM debian:latest

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package lists and install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  wget \
  tar \
  bash \
  ca-certificates \
  sudo \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libffi-dev

# Copy the Python source tarball into the image
COPY Python-3.11.9.tgz /tmp/

# Extract, build, and install Python 3.11.9
RUN cd /tmp && \
    tar -xvf Python-3.11.9.tgz && \
    cd Python-3.11.9 && \
    ./configure --enable-optimizations && \
    make -j 8 && \
    make altinstall && \
    cd .. && \
    rm -rf Python-3.11.9 Python-3.11.9.tgz

# Create symbolic links for python, python3, pip, and pip3
RUN ln -s /usr/local/bin/python3.11 /usr/bin/python && \
    ln -s /usr/local/bin/python3.11 /usr/bin/python3 && \
    ln -s /usr/local/bin/pip3.11 /usr/bin/pip && \
    ln -s /usr/local/bin/pip3.11 /usr/bin/pip3

# Install OpenJDK 17
RUN apt-get install -y openjdk-17-jdk-headless

# Install the PySpark library using pip
RUN python3.11 -m pip install pyspark

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PYTHONPATH=/usr/local/lib/python3.11/dist-packages
ENV PYSPARK_PYTHON=/usr/local/bin/python3.11
ENV PATH=$PATH:$JAVA_HOME/bin

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
