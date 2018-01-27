FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN add-apt-repository -y ppa:beineri/opt-qt-5.10.0-xenial
RUN apt-get -y update
RUN apt-get -y install \
    build-essential \
    g++-7 \
    gcc-7 \
    git \
    qt510-meta-full \
    wget

# Install latest stable CMake
RUN mkdir -p /tmp/cmake && \
    cd /tmp/cmake && \
    wget --no-check-certificate https://cmake.org/files/v3.10/cmake-3.10.0-Linux-x86_64.sh && \
    chmod +x cmake-3.10.0-Linux-x86_64.sh && \
    ./cmake-3.10.0-Linux-x86_64.sh --skip-license --prefix=/usr/local

ENV PATH="/usr/local/bin:${PATH}"
ENV QT5_DIR=/opt/qt510/lib/cmake
