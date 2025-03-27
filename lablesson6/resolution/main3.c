#include <stdio.h>

int is_par(const int N) {
    return (!(N % 2)) && (N > 0);
}

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

void goldbach(int value) {
    int first = 1;
    printf("%d é a soma de: ", value);
    for (int i=2; i<=(value / 2); i++) {
        if (is_prime(i) && is_prime(value-i)) {
            printf("%s(%i, %i)", first?"":", ", i, value-i);
            first = 0;
        }
    }
    printf(".\n");
}

int main(void) {
    int value;
    while(1) {
        printf("\nInserir um número: ");
        scanf("%i", &value);
        if (is_par(value)) {
            goldbach(value);
            continue;
        }
        if (value == 0) break;
        printf("O número não é par ou não é positivo.\n");
    }

    printf("Terminado\n");
    return 0;
}