#include <stdio.h>

#define MAX_PRIME_DIV 50

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

int factorisation(int store_dec[2][MAX_PRIME_DIV], int value) {
    int red_value = value;
    int index = 0;
    for (int i=2; red_value > 1; i++) {
        if (!is_prime(i) || (red_value % i)) continue;

        store_dec[0][index] = i;
        while (!(red_value % i)) {
            red_value = red_value / i;
            store_dec[1][index]++;
        }
        index++;
    }
    return index;
}

void show_factors(int store_dec[2][MAX_PRIME_DIV], int max_idx) {
    for (int i=0; i<max_idx; i++) {
        printf("%i  ", store_dec[0][i]);
        if (store_dec[0][i] <10) printf((" "));
    }
    printf("\n");
    for (int i=0; i<max_idx; i++) {
        printf("%i  ", store_dec[1][i]);
        if (store_dec[1][i] <10) printf((" "));
    }
    printf("\n");
}

void show_formula(int store_dec[2][MAX_PRIME_DIV], int max_idx, int value) {
    if (store_dec[1][0] == 1) {
        printf("\n%i = %i", value, store_dec[0][0]);
    } else {
        printf("\n%i = %i^%i", value, store_dec[0][0], store_dec[1][0]);
    }

    for (int i=1; i<max_idx; i++) {
        if (store_dec[1][i] == 1) {
            printf(" * %i", store_dec[0][i]);
        } else {
            printf(" * %i^%i", store_dec[0][i], store_dec[1][i]);
        }
    }
    printf("\n");
}

int main() {
    int value;

    do {
        printf("\nPlease enter a positive number: ");
        scanf("%i", &value);

        if (value <= 1) continue;

        int store_dec[2][MAX_PRIME_DIV] = {0};
        int index = factorisation(store_dec, value);
        show_factors(store_dec, index);
        show_formula(store_dec, index, value);

    } while (value != 0);

    printf("Terminado\n");
    return 0;
}
