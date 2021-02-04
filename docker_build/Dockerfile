FROM ubuntu:20.10

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y git cmake doxygen binutils-arm-none-eabi gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir pico && \
    cd pico && \
    git clone -b master https://github.com/raspberrypi/pico-sdk.git && \
    cd pico-sdk && \
    git submodule update --init

ENV PICO_SDK_PATH=/pico/pico-sdk


CMD cd /src/build && cmake .. && make -j4 && ls

