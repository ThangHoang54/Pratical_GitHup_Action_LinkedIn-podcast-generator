FROM ubuntu:latest

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean

# Install Python packages
RUN pip3 install --no-cache-dir PyYAML

# Copy scripts
COPY feed.py /usr/local/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]