cmake_minimum_required(VERSION 3.13)

include($ENV{PICO_SDK_PATH}/external//pico_sdk_import.cmake)

project(test_project)
pico_sdk_init()
add_executable(blink
    blink.c)

pico_add_extra_outputs(blink)

target_link_libraries(blink pico_stdlib)