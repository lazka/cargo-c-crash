#include "libimagequant.h"
#include <stdio.h>

int main(void) {
    int version = liq_version();
    printf("Version: %d\n", version);

    return 0;
}
