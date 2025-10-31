FROM --platform=linux/amd64 ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive

# set time zone to ce(s)t
ENV TZ=Europe/Vienna

RUN apt-get update

RUN apt-get install -y \
    # g++, gcc, make, gdb, cmake
    build-essential \
    gdb \
    cmake \
    # alternative compiler and debugger
    clang \
    lldb \
    # nasty memory leaks
    valgrind\
    # ninja build system
    ninja-build \
    # somewhat useful stuff
    curl \
    wget \
    unzip \
    # python
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

