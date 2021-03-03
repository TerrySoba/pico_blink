#!/bin/sh
set -e

docker build -t pico_build docker_build
# docker run --user $(id -u):$(id -g) -v `pwd`:/src pico_build
# docker run --privileged -v `pwd`:/src pico_build
docker run --user $(id -u):$(id -g) -v `pwd`:/src pico_build bash -c "cd /src/build && cmake .. && make -j4"
# docker run --privileged -v `pwd`:/src pico_build bash -c "cd /src/build && openocd -f interface/picoprobe.cfg -f target/rp2040.cfg -c \"program blink.elf verify reset exit\""

