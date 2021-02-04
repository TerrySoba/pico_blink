#!/bin/sh

docker build -t pico_build docker_build
docker run --user $(id -u):$(id -g) -v `pwd`:/src pico_build
