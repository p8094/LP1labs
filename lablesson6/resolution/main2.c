#include <stdio.h>

int is_prime(const int N) {
    if (N < 2) {
        return 0;
    }

    for (int i=2; (i*i)<=N; i++) {
        if (N % i == 0) {
            return 0;
        }
    }
    return 1;
}

int main(void) {
    int value;
    do {
        printf("\nInserir um número: ");
        scanf("%i", &value);
        printf("O número %sé primo.\n", is_prime(value)?"":"não ");
    } while(value != 0);

    printf("Terminado\n");
    return 0;
}
