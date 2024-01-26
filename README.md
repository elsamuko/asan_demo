# Address Sanitizer Demo

Demo how to use gcc's address sanitizer flags

## Building

Add these to your CMakeLists.txt to compile with ASAN support:
```
    target_compile_options(your_app PRIVATE -fsanitize=address -g)
    target_link_libraries(your_app -fsanitize=address)
```

## Running

```
./run.sh
```
