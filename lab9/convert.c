#include <stdio.h>

int cToF(int x)
{
    return (9.0 / 5.0 * x) + 32.0;
}

int fToC(int x)
{
    return (x - 32.0) * 5.0 / 9.0;
}
