cmake_minimum_required(VERSION 3.22)
project(asan_demo LANGUAGES CXX)

option(WITH_SAN "build with address sanitizer flags" ON)
option(WITH_LEAK_SAN "build with LeakSanitizer demo" OFF)
option(WITH_ADDRESS_SAN "build with AddressSanitizer demo" OFF)

add_executable(asan_demo src/asan_demo.cpp)

if(WITH_SAN)
    # https://github.com/google/sanitizers/wiki/AddressSanitizer#using-addresssanitizer
    target_compile_options(asan_demo PRIVATE -fsanitize=address -g)
    target_link_libraries(asan_demo -fsanitize=address)
endif()

if(WITH_LEAK_SAN)
    target_compile_definitions(asan_demo PRIVATE WITH_LEAK_SAN=1)
endif()

if(WITH_ADDRESS_SAN)
    target_compile_definitions(asan_demo PRIVATE WITH_ADDRESS_SAN=1)
endif()
