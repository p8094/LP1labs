---
marp: true
theme: default
paginate: true
incremental: true
header: "Linguagens de Programação 1 | LEI, LEIRT, LIG"
footer: "![logo](../images/logo_lusofona.png)  Pedro Arroz Serra | pedro.serra@ulusofona.pt"
---


<style>
img[alt="logo"] {
  width: auto;  /* Adjust width */
  height: 25px; /* Keep aspect ratio */
  vertical-align: bottom; /* Align text with the image */
}
img[alt="pic_middle"] {
  width: auto;  /* Adjust width */
  height: 150px; /* Keep aspect ratio */
  vertical-align: middle; /* Align text with the image */
}
.grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}

img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
ul { list-style-type: none; padding-left: 0;}

</style>


# Conteúdo

- **Revisão**: revisão de aula 5 (arrays, strings, matrizes)
- **Structures**: juntar variaveis numa novo tipo
- **Teste TecWeb**: enunciado TecWeb, deadline 24/3/2025@9hrs
- **Test Aula 5**: 5 perguntas escolha multipla, 5 "programas" de ~5 linhas

---
<div class='grid'>
<div>

# Vectores (Arrays)

* Um vector é um conjunto de elementos do **mesmo tipo**.
* Ocupam **posições contíguas** na memória.
* Índices começam em **0**!

<div data-marpit-fragment>

```c
char socos[5] = {100, 120, 90, 130, 110};
printf("Soco mais forte: %d\n", socos[3]); // 130
```
</div>

A tabela exemplifica o modelo de memória. Os Endereços são definidos no momento em que o programa corre.


</div>
<div>

<div data-marpit-fragment>

<sub>Modelo da memória RAM:</sub>

<small>

| Endereço | Conteudo | Identificador |
|------|------|-----------|
| 1023 | 100  |`socos[0]` |
| 1024 | 120  |`socos[1]` |
| 1025 | 90   |`socos[2]` |
| 1026 | 130  |`socos[3]` |
| 1027 | 110  |`socos[4]` |
|      | 1023 |`socos`    |
|...   |      |           |

</small>

</div>

A variável `socos` contém o endereço de memória do elemento `socos[0]` (primeiro elemento do vector)

</div>
</div>

---

# Vetores como Parâmetros de Função

> Em C, os vetores são passados por referência para funções
> Isso significa que qualquer alteração dentro da função afeta o vetor original.

* **Exemplo: Modificando um vetor dentro de uma função**

<div class='grid'><div>

<div data-marpit-fragment>

```c
#include <stdio.h>

void modificar(int v[], int tamanho) {
  for (int i = 0; i < tamanho; i++) {
    v[i] *= 2; // Dobra cada elemento
  }
}
```

</div>

</div><div>

<div data-marpit-fragment>

```c
int main() {
  int valores[] = {1, 2, 3, 4, 5};
  int n = 5;

  modificar(valores, n);

  for (int i = 0; i < n; i++) {
    printf("%d ", valores[i]); // Imprime: 2 4 6 8 10
  }
  return 0;
}
```

</div>

</div></div>

✅ **O vetor `valores` foi modificado dentro da função `modificar()`!**


---

# Cadeias de Caracteres (Strings) em C

* Strings em C são **vetores de caracteres** terminados pelo caractere especial `\0` (caractere nulo).
* Devemos sempre reservar espaço para o caractere `\0` ao declarar uma string.

```c
char nome[10]; // Permite até 9 caracteres + '\0'
```

---

# Declaração e Inicialização de Strings

```c
char nome[20] = "oscar";
  
char nome[20] = {'o','s','c','a','r', '\0'};

char nome[] = "oscar"; 
// O compilador define o tamanho automaticamente. Incluindo espaço para o \0

char *nome = "oscar"; 
```

* ⚠️ O `\0` deve ser sempre considerado, pois indica o fim da string.


---

# Comprimento de uma String

```c
int n = strlen(nome);

printf("A string tem %d caracteres", n);
```

* ⚠️ `strlen()` retorna apenas o número de caracteres **antes** do `\0`.

---

# `printf()` e `scanf()` com Strings

```c
printf("%s\n", var);  // Imprime a string normalmente
printf("%10s\n", var); // Alinha à direita com espaço mínimo de 10 caracteres
printf("%-10s\n", var); // Alinha à esquerda

puts(var); // Similar ao printf("%s\n", var), sempre adiciona o ´/n´

scanf("%s", nome);  // Lê até encontrar espaço ou \n
scanf("%5s", nome);  // Lê até 5 caracteres

scanf("%[^\n]s", nome); // Lê até \n

fgets(nome, 128, stdin); // Alternativa segura
```


---

## 📊 Matrizes: Vectores de Vectores

* Uma **matriz** é um **vetor multidimensional**, i.e. **vector de vectores**
* São declaradas com **duas dimensões ou mais**.

* Em C, declaramos assim:

```c
int socos[2][3] = { 
  {100, 120, 110}, // Linha 0
  {90,  130, 105}  // Linha 1
};
```

📌 **Dica**: A primeira dimensão é **linhas**, a segunda é **colunas**.

---

# 🏗️ Estrutura de Matrizes

* **Primeira dimensão** → Número de **linhas**  
* **Segunda dimensão** → Número de **colunas**  

```c
tipo nome_matriz[num_linhas][num_colunas];
```

✅ Exemplo:

```c
char Galo[3][3]; // Matriz 3x3
Galo[0][0] = 'X';
Galo[0][2] = 'O';
Galo[1][1] = 'X';
Galo[2][2] = 'O';
```

✅ `Galo[2][2]` armazena `'O'`.

---


# 🔄 Percorrer Matrizes

💡 **Dica**: percorre **linha a linha**!

```c
for (int i = 0; i < 2; i++) {
  for (int j = 0; j < 3; j++) {
    printf("Soco[%d][%d]: %d\n", i, j, socos[i][j]);
  }
}
```


---
# 🚀 Inicialização Automática

<div class='grid'>
<div>

* **Podemos inicializar uma matriz no momento da declaração**:

<div data-marpit-fragment>

```c
char soup[5][5] = {
  {'f', 'e', 'k', 'u', 'l'},
  {'u', 'o', 'x', 's', 'n'},
  {'t', 'n', 'r', 'e', 'r'},
  {'y', 'h', 'e', 'c', 'j'},
  {'v', 'q', 'e', 'w', 'e'}
};
```
</div>
</div>
<div>

* ✅ **Podemos omitir o número de linhas** (o compilador infere):

<div data-marpit-fragment>
   
```c
char soup[][5] = {
  {'e', 'e', 'k', 'u', 'l'},
  {'u', 'c', 'x', 'q', 'n'},
  {'t', 's', 'r', 'd', 'r'},
  {'y', 'h', 'e', 'o', 'j'},
  {'v', 'q', 'e', 'w', 'f'}
};
```

</div>

* ⚠️ **Não podemos omitir o número de colunas**!

</div>
</div>

---

# 🔍 Acesso a Elementos

* Podemos **acessar e modificar** elementos da matriz:

<div data-marpit-fragment>

```c
char soup[5][5];
soup[0][0] = 'e';
soup[0][1] = 'e';
soup[0][2] = 'u';
soup[0][3] = 'l';
soup[1][0] = 'u';
```

</div>

* ✅ Cada elemento é referenciado como `matriz[linha][coluna]`.

---
# Estruturas (`struct`) em C

As `structs` em C permitem agrupar diferentes tipos de dados numa única estrutura lógica.


```c
#include <stdio.h>

struct Pessoa {
    char nome[50];
    int idade;
    float altura;
};
```

Aqui criamos uma `struct` chamada `Pessoa` que contém três membros: uma string, um inteiro e um `float`.

---

# Utilização de `structs`

```c
struct Pessoa pessoa1;
pessoa1.idade = 25;
pessoa1.altura = 1.75;
strcpy(pessoa1.nome, "João");
```

Podemos declarar variáveis do tipo `struct Pessoa` e atribuir valores aos seus membros.

---

# Uso com `typedef`

```c
typedef struct Pessoa{
    char nome[50];
    int idade;
} pessoa_st;

pessoa_st pessoa2;
```

O `typedef` simplifica a sintaxe, permitindo criar `structs` sem necessidade de `struct` antes do nome.

---

## Array de `structs`

```c
pessoa_st pessoas[3] = {
    {"Ana", 30},
    {"Bruno", 25},
    {"Carla", 28}
};
```

Podemos criar um array de `structs` para armazenar múltiplas pessoas.

---

# Encontrar uma pessoa pelo nome

```c
#include <string.h>

int encontrar_pessoa(pessoa_t pessoas[], int len, char *nome) {
    for (int i = 0; i < len; i++) {
        if (strcmp(pessoas[i].nome, nome) == 0) {
            return i;
        }
    }
    return -1;
}

```

Esta função percorre o array de `structs` e retorna a pessoa correspondente ao nome buscado.

---

# Exemplo

Uma maneira para retornar seguramente a pessoa é de retornar o indice no array, em vez da estrutra. 

```c
int idx = encontrar_pessoa(pessoas, sizeof(pessoas)/sizeof(pessoa_st), "Bruno");

if (idx < 0) {
    printf("Pessoa não encontrada\n");
} else {
    printf("A pessoa %s tem %d anos\n", pessoas[idx].nome, pessoas[idx].idade)
}

```
---
# Retornar structs é desaconcelhado

```c
pessoa_t encontrar_pessoa(pessoa_t pessoas[], int len, char *nome) {
    for (int i = 0; i < len; i++) {
        if (strcmp(pessoas[i].nome, nome) == 0) {
            return pessoas[i];
        }
    }    
    pessoa_st vazia = {"", 0};
    return vazia;
}
``` 
Se o struct não tem ponteiros ou locações dinâmicas, funciona corretamente, pois os dados são copiados para o local de retorno da função. 

> **nome:** a referencia para o nome é copiado (ou seja, aponta para o mesmo string)
> **idade**: uma copia do valor de idade 

---

# ❓ Q&A  

💬 **Dúvidas?**  

---

# Teste TecWeb

O teste **TecWeb** é para fazer na semana da tecweb. O teste é para fazer em casa e conta para nota: https://moodle.deisi.ulusofona.pt/
![h:300 center](./teste-tecweb.png)

---

# Teste Aula 5

Link: https://moodle.deisi.ulusofona.pt/
![h:300 center](./teste5.png)

Depois de acabar, podem começar com o teste tecweb