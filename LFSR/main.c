#include <stdio.h>
extern unsigned long lfsr_assembly(unsigned long seed);

int main(void)
{
    unsigned long initialSeedC;
    unsigned long initialSeedASM;

    initialSeedC = lfsrC(0x5AA5FF00);
    initialSeedASM = lfsr_assembly(0x5AA5FF00);

    printf("C code: \n");

    for (int i = 1; i <= 20; i++)
    {
        initialSeedC = lfsrC(initialSeedC);
        printf("%d            %lu\n", i, initialSeedC);
    }

    printf("Assembly code: \n");
    for (int i = 1; i <= 20; i++)
    {
        initialSeedASM = lfsr_assembly(initialSeedASM);
        printf("%d            %lu\n", i, initialSeedASM);
    }

    return 0;
}
