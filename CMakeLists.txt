cmake_minimum_required(VERSION 3.22)
project(asan_demo LANGUAGES CXX)

add_executable(asan_demo src/asan_demo.cpp)

# https://github.com/google/sanitizers/wiki/AddressSanitizer#using-addresssanitizer
target_compile_options(asan_demo PRIVATE -fsanitize=address -g)
target_link_libraries(asan_demo -fsanitize=address)
