FROM --platform=linux/amd64 ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive

# set time zone to ce(s)t
ENV TZ=Europe/Vienna

RUN apt-get update

RUN apt update && apt install -y \
    # git
    git \
    # g++, gcc, make, gdb, cmake
    build-essential \
    gdb \
    cmake \
    # alternative compiler and debugger
    clang \
    lldb \
    # nasty memory leaks
    valgrind \
    # ninja build system
    ninja-build \
    # somewhat useful stuff
    curl \
    wget \
    unzip \
    # python
    python3 \
    python3-pip \
    python3-venv \
    # network
    netcat-openbsd \
    # utilities
    coreutils \
    libtool-bin \
    locales \
    autoconf \
    automake \
    pkg-config \
    autoconf-archive \
    # protobuf
    protobuf-compiler \
    libprotobuf-dev \
    libzmq3-dev \
    # for scripts
    sudo \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# modify gdb to work on apple silicon
# https://github.com/docker/for-mac/issues/6921#issuecomment-2409324575
# COPY  ../.devcontainer/gdb /usr/local/bin/gdb

