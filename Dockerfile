FROM resin/rpi-raspbian:jessie

# Install build dependencies 
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    git
