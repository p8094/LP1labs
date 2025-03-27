#import "../ulusofona/main.typ": tags

#show: tags.with(
  class: "LP1 2024/2025",
  title: "Mini Projeto: Radar de Barcos",
  date: datetime.today(),
  authors: ("Pedro Arroz Serra", "Daniel Silveira", "Giosuè Muratore", "Martijn Kuipers"),
  version: "1.3",
  deadline: "06/04/2025 @ 23:59hrs no deisi-moodle"
)

#show link: underline

= Introdução
Na resolução deste projecto deve ser utilizada a Linguagem de Programação C. 
Para além da correta implementação do objectivo, tenha em conta os seguintes aspetos:

- O código apresentado deve ser bem indentado.
- Tenha em atenção os nomes dados das variáveis, para que sejam indicadores daquilo que as mesmas vão conter.
- Não é permitida a utilização de variáveis globais ou estáticas
- O trabalho deve ser desenvolvido e submetido de forma individual.
- O programa deve ser devidamente comentado incluindo as funcões, parametros, variaveis (ver exemplo função fornecida como exemplo) 
- O programa tem de verificar todas as situações de dados inválidos

O não cumprimento deste aspectos incorre uma penalização de 50% da nota.

O código deve compilar sem erros ou warnings, neste caso a penalização é 100% e aluno não é avaliado.

Todos os trabalhos serão comparados utilizando um sistema de deteção de plágio
Em caso de plágio o plagiado e plagiante tem uma *penalização de 100%* e não serão avaliados.

Todos os trabalhos com código compilado e não plagiado serão revistos e submetidos a avaliação oral

*Importante:* Entrega apenas o ficheiro _main.c_ no moodle no #link("https://moodle.deisi.ulusofona.pt/mod/assign/view.php?id=500")[DEISI]

= Objetivo

Desenvolver um programa em C que simule um radar de barcos num mapa de 20 linhas por 80 colunas. O radar capta duas leituras (antes e depois) com *5 barcos identificados pelas letras A, B, C, D e E*.

O programa deverá realizar várias operações usando *funções*, *arrays* e *structs*, sem utilizar ponteiros.


== Descrição Geral

O programa irá:

1. Ler duas tabelas de radar (matrizes de 20x80) que representam a posição dos barcos *antes* e *depois*.  Cada célula pode conter:
     - `'.'` (água)
     - `'A'`, `'B'`, `'C'`, `'D'` ou `'E'` (um dos barcos)
#pagebreak()
2. Apresentar ao utilizador o seguinte *menu*:

```
1 - Imprimir tabela "antes"

2 - Imprimir tabela "depois"

3 - Consultar as coordenadas de um barco

4 - Listar barcos que se moveram (esquerda, direita, cima, baixo)

5 - Sair
```


> ⚠️ *Cada opção do menu deverá corresponder obrigatoriamente a uma função separada.*

---

== Funcionalidades detalhadas

=== 1) Imprimir tabela "antes"
Função que imprime no ecrã a tabela da primeira leitura.

=== 2) Imprimir tabela "depois"
Função que imprime no ecrã a tabela da segunda leitura.

=== 3) Consultar as coordenadas de um barco
- Perguntar qual tabela (1 ou 2) o utilizador deseja consultar.
- Perguntar qual barco (A, B, C, D ou E) deseja localizar.
- Imprimir as coordenadas (linha e coluna) onde o barco se encontra nessa tabela. *(a tabela começa na linha 0 e coluna 0)*

=== 4) Listar barcos que se moveram
- Comparar as duas tabelas.
- Para cada barco, verificar se mudou de posição:
  - Se sim, indicar o movimento: *cima*, *baixo*, *esquerda* ou *direita* (movimento de uma célula).
  - Caso o barco não se tenha movido, indicar "não se moveu".

=== 5) Sair
Termina o programa.

---

== Regras obrigatórias

- *Criar uma função distinta para cada opção do menu.*
- Utilizar *struct Barco* obrigatoriamente:
  
```c
struct Barco {
    char id;     // 'A', 'B', 'C', 'D' ou 'E'
    int linha;
    int coluna;
};
```
#pagebreak()

== Exemplo visual de uma tabela (5x10 para simplificação):

Tabela Antes:
```
..........
....A.....
..........
.C.....E..
....B.D...
```

Tabela Depois:
```
..........
.....A....
..........
.C.....E..
....B.D...
```

Neste exemplo, o barco A moveu-se uma célula para a direita.

= Função fornecida: Leitura de tabela do ficheiro

```c
#include <stdio.h>

/*
 * Função para ler uma tabela de um ficheiro e armazená-la numa matriz bidimensional.
 * 
 * @param tabela      Matriz de caracteres com 20 linhas e 80 colunas, 
 *                    onde os dados do ficheiro serão armazenados.
 * @param nomeFicheiro Nome do ficheiro a ser lido.
 */
void lerTabelaDeFicheiro(char tabela[20][80], const char *nomeFicheiro) {
    // Abre o ficheiro para leitura
    FILE *ficheiro = fopen(nomeFicheiro, "r");

    // Verifica se o ficheiro foi aberto corretamente
    if (ficheiro == NULL) {
        printf("Erro ao abrir o ficheiro %s\n", nomeFicheiro);
        return; // Se não for possível abrir o ficheiro, a função termina imediatamente
    }

    // Percorre a matriz para preencher os 20x80 caracteres com dados do ficheiro
    for (int i = 0; i < 20; i++) { // Loop externo para as 20 linhas
        for (int j = 0; j < 80; j++) { // Loop interno para as 80 colunas
            char c = fgetc(ficheiro); // Lê um único carácter do ficheiro

            // Se o carácter for uma nova linha, ignora-o e lê o próximo carácter
            if (c == '\n') {
                c = fgetc(ficheiro);
            }

            // Armazena o carácter lido na matriz
            tabela[i][j] = c;
        }
    }

    // Fecha o ficheiro após a leitura
    fclose(ficheiro);
}
```

Exemplo do uso da função:

```c
char tabelaAntes[20][80];
char tabelaDepois[20][80];

lerTabelaDeFicheiro(tabelaAntes, "tabela_antes.txt");
lerTabelaDeFicheiro(tabelaDepois, "tabela_depois.txt");
```

#pagebreak()

= Dicas
Cria funções auxiliares para modularizar o teu código.

Mantém o código bem organizado e legível.

Podes usar funções como:

void imprimirTabela(char tabela[20][80]);

void consultarCoordenadas(char tabela[20][80]);

void listarMovimentos(char tabelaAntes[20][80], char tabelaDepois[20][80]);

Usa os seguintes printfs:

```c
        printf("\nMenu:\n");
        
        printf("1) Imprimir tabela 'antes'\n");
        
        printf("2) Imprimir tabela 'depois'\n");
        
        printf("3) Consultar as coordenadas de um barco\n");
        
        printf("4) Listar barcos que se moveram\n");
        
        printf("5) Sair\n");
        
        printf("Escolha uma opcao: ");
        
        printf("Saindo...\n");
        
        printf("Opcao invalida. Tente novamente.\n");
        
        printf("%c", tabela[i][j]);
        
        printf("Digite a letra do barco (A, B, C, D, E): ");
        
        printf("Linha %d, Coluna %d\n", barcos[i].id, barcos[i].linha, barcos[i].coluna);
        
        printf("Barco nao encontrado!\n");
        
        printf("%c: Nao se moveu\n", antes[i].id);
        
        printf("%c: Moveu para cima\n", antes[i].id);
        
        printf("%c: Moveu para baixo\n", antes[i].id);
        
        printf("%c: Moveu para esquerda\n", antes[i].id);
        
        printf("%c: Moveu para direita\n", antes[i].id);
```

#pagebreak()


= Exemplo de execução do programa
```
Menu:
1) Imprimir tabela 'antes'
2) Imprimir tabela 'depois'
3) Consultar as coordenadas de um barco
4) Listar barcos que se moveram
5) Sair
Escolha uma opcao: 1
................................................................................
................................................................................
................................................................................
....A...........................................................................
................................................................................
................................................................................
................................................................................
................................................................................
.......................................................B........................
................................................................................
................................................................................
..................................C.............................................
................................................................................
................................................................................
..................................................D.............................
................................................................................
................................................................................
................................................................................
.................................E..............................................
................................................................................

<<<<<<< HEAD
=======
```

```
>>>>>>> 9789ac4196ca8bbb61febefce080c16395587c9c
Menu:
1) Imprimir tabela 'antes'
2) Imprimir tabela 'depois'
3) Consultar as coordenadas de um barco
4) Listar barcos que se moveram
5) Sair
Escolha uma opcao: 2
................................................................................
................................................................................
................................................................................
...A............................................................................
................................................................................
................................................................................
................................................................................
................................................................................
.......................................................B........................
................................................................................
................................................................................
..................................C.............................................
................................................................................
................................................................................
................................................................................
...................................................D............................
................................................................................
................................................................................
.................................E..............................................
................................................................................

<<<<<<< HEAD
=======
```

```
>>>>>>> 9789ac4196ca8bbb61febefce080c16395587c9c
Menu:
1) Imprimir tabela 'antes'
2) Imprimir tabela 'depois'
3) Consultar as coordenadas de um barco
4) Listar barcos que se moveram
5) Sair
Escolha uma opcao: 3
Digite a letra do barco (A, B, C, D, E): c
Barco nao encontrado!

Menu:
1) Imprimir tabela 'antes'
2) Imprimir tabela 'depois'
3) Consultar as coordenadas de um barco
4) Listar barcos que se moveram
5) Sair
Escolha uma opcao: 3
Digite a letra do barco (A, B, C, D, E): C
Linha 67, Coluna 11

```

```

Menu:
1) Imprimir tabela 'antes'
2) Imprimir tabela 'depois'
3) Consultar as coordenadas de um barco
4) Listar barcos que se moveram
5) Sair
Escolha uma opcao: 4
A: Moveu para esquerda
B: Nao se moveu
C: Nao se moveu
D: Moveu para baixo
D: Moveu para direita
E: Nao se moveu

Menu:
1) Imprimir tabela 'antes'
2) Imprimir tabela 'depois'
3) Consultar as coordenadas de um barco
4) Listar barcos que se moveram
5) Sair
Escolha uma opcao: 5
Saindo...

Process finished with exit code 0

```
