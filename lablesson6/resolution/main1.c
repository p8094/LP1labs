#include <stdio.h>

int is_par(const int N) {
    return (!(N % 2)) && (N > 0);
}

int main(void) {
    int value;
    while(1) {
        printf("\nInserir um número: ");
        scanf("%i", &value);
        if (is_par(value)) {
            printf("O número é par e positivo.\n");
            continue;
        }
        if (value == 0) break;
        printf("O número não é par ou não é positivo.\n");
    }

    printf("Terminado\n");
    return 0;
}
