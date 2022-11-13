//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

//
#include "types.h"

//Baseline - naive implementation
f64 reduc_base(f64 *restrict a, u64 n)
{
    double d = 0.0;

    for (u64 i = 0; i < n; i++)
        d += a[i];

    return d;
}

f64 reduc_unroll4(f64 *restrict a, u64 n)
{

#define UNROLL4 4
    double d = 0.0;
    double d1 = 0.0;
    double d2 = 0.0;
    double d3 = 0.0;

    for (u64 i = 0; i < (n - (n & (UNROLL4 - 1))); i+=UNROLL4)
    {
        d += a[i];
        d1 += a[i];
        d2 += a[i];
        d3 += a[i];
    }

    for (u64 i = (n -(n & (UNROLL4-1))); i < n; i++)
        d+=a[i];

    d+=d1+d2+d3;
    return d;
}

f64 reduc_unroll8(f64 *restrict a, u64 n)
{

#define UNROLL8 8
    double d = 0.0;
    double d1 = 0.0;
    double d2 = 0.0;
    double d3 = 0.0;
    double d4 = 0.0;
    double d5 = 0.0;
    double d6 = 0.0;
    double d7 = 0.0;

    for (u64 i = 0; i < (n - (n & (UNROLL8 - 1))); i+=UNROLL8)
    {
        d += a[i];
        d1 += a[i];
        d2 += a[i];
        d3 += a[i];
        d4 += a[i];
        d5 += a[i];
        d6 += a[i];
        d7 += a[i];
    }

    for (u64 i = (n -(n & (UNROLL8 - 1))); i < n; i++)
        d+=a[i];

    d+=d1+d2+d3+d4+d5+d6+d7;
    return d;
}

