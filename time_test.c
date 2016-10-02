#include <stdio.h>
#include <stdint.h>
#include "clz.h"

int main(int argc,char const *argv[])
{
    uint32_t x = 100;
    int clz;

#if defined(RECURSIVE)
    clz = clz_recursive(x,16);
#endif

#if defined(ITERATION)
    clz = clz_iteration(x);
#endif

#if defined(BINARYSEARCH)
    clz = clz_binary_search(x);
#endif

#if defined(BYTESHIFT)
    clz = clz_byte_shift(x);
#endif

#if defined(HARLEY)
    clz = clz_harley(x);
#endif

    printf(" X = %d,clz = %d\n",x,clz);
    return 0;
}
