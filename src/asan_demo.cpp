#include <iostream>

#define LOG( A ) std::cout << A << std::endl;

int main( int argc, char* argv[] ) {
    LOG( "Hello from generated asan_demo.cpp" );

    // LeakSanitizer: detected memory leaks
    char* x = ( char* )malloc( 10 * sizeof( char* ) );

    // AddressSanitizer: heap-use-after-free
    char* x2 = ( char* )malloc( 10 * sizeof( char* ) );
    free( x2 );
    x2[1] = 'a';

    return 0;
}
