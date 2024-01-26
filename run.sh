#!/usr/bin/env bash

function green  {
    echo -e "\033[1;32m$*\033[0m"
}

function indent {
    sed  's/^/    /'
}

green "Leak Sanitizer Demo"
rm CMakeCache.txt
cmake -DWITH_LEAK_SAN=ON > /dev/null 2>&1
cmake --build .  > /dev/null 2>&1
./asan_demo 2>&1 | indent

echo
green "Address Sanitizer Demo"
rm CMakeCache.txt
cmake -DWITH_ADDRESS_SAN=ON  > /dev/null 2>&1
cmake --build .  > /dev/null 2>&1
./asan_demo 2>&1 | indent
