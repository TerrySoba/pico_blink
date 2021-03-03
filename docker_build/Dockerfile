FROM ubuntu:20.10

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y git pkg-config cmake doxygen binutils-arm-none-eabi gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential python3 automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir pico && \
    cd pico && \
    git clone -b master https://github.com/raspberrypi/pico-sdk.git && \
    cd pico-sdk && \
    git submodule update --init

ENV PICO_SDK_PATH=/pico/pico-sdk

RUN cd pico && \
    git clone https://github.com/raspberrypi/openocd.git --branch picoprobe --depth=1 --no-single-branch && \
    cd openocd && \
    ./bootstrap && \
    ./configure --enable-picoprobe && \
    make -j4 && \
    make install

# CMD cd /src/build && cmake .. && make -j4 && ls -lh && openocd -f interface/picoprobe.cfg -f target/rp2040.cfg -c "program blink.elf verify reset exit"

