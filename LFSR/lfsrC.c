#include <stdio.h>

unsigned long lfsrC(unsigned long seed)
{
    if (seed == 0)
    {
        return (seed + 1); //0 + 1 = 1
    }

    else if (((seed ^ (seed >> 0) ^ (seed >> 2) ^ (seed >> 6) ^ (seed >> 7) & 1)))
    {
        unsigned int bits = ((seed ^ (seed >> 0) ^ (seed >> 2) ^ (seed >> 6) ^ (seed >> 7) & 1));
        return ((bits << 31) | (seed >> 1)); //generated random number
    }

    else if (seed != 0)
    {
        return seed >> 1; //initial "seed" value
    }
}

