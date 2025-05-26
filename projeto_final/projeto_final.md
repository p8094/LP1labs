---
marp: true
theme: default
paginate: true
incremental: true
header: "Linguagens de Programação 1 | LEI, LEIRT, LIG"
footer: "![logo](../images/logo_lusofona.png)  Pedro Arroz Serra | Daniel Silveira | Giosuè Muratore | Martijn Kuipers"
style: |
  @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css');
    section {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-start;
        height: 100%;
        padding-top: 80px;
    }
    p {
        width: 100%;
    }
    pre {
        width: 100%;
        box-sizing: border-box;
    }
    img[alt="logo"] {
        width: auto;
        height: 25px;
        vertical-align: bottom;
    }
    img[alt="pic_middle"] {
        width: auto;
        height: 150px;
        vertical-align: middle;
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
    img[alt~="right"] {
        float: right;
        margin: 0 auto;
    }
    hr {
        width: 100%;
        border: none;
        height: 1px;
        background: linear-gradient(to right, #ddd, #333, #ddd);
        margin: 20px 0;
    }
---


# Projeto Radar Náutico - LP1

**Compreender a estrutura `BaseDados` e `EntidadeIED`**
<br /><br /><br />
<hr />
<br />

## Isto são apenas sugestões, podem implementar a vossa solução diferent, desde que cumpre todos os requisitos.

---

# O que é a `BaseDados`?

- Uma **lista ligada** de frames
- Cada `BaseDados` representa **um momento (frame)** na simulação
- Guarda:
  - O número do frame (`frame_atual_num`)
  - Uma lista de embarcações nesse momento (`EntidadeIED`)
  - Um ponteiro para o próximo frame

💡 É a "linha do tempo" da simulação!

---

# O que é uma `EntidadeIED`?

- Representa **uma embarcação visível no radar em um determinado segundo**
- Contém:
  - Posição `(x, y)`
  - Velocidade `(vx, vy)`
  - Ponteiro para o barco real (`NoVessel`)
  - Ponteiro para a próxima entidade no mesmo frame

💡 É um "snapshot" de um barco num instante do tempo!

---

# Relação entre as Estruturas

\`\`\`
BaseDados (frame 1)
 └── EntidadeIED A → EntidadeIED B → EntidadeIED C
BaseDados (frame 2)
 └── EntidadeIED A → EntidadeIED C
\`\`\`

- Cada `BaseDados` aponta para uma **lista ligada de entidades (barcos ativos)**
- Cada `EntidadeIED` aponta para um barco (`NoVessel`)

---

# Para que servem?

### `BaseDados`:
✔️ Guarda a **história completa da simulação**  
✔️ Permite voltar no tempo (histórico)  
✔️ Útil para calcular **velocidade média** ou prever colisões

### `EntidadeIED`:
✔️ Representa cada barco no **frame atual**  
✔️ Atualiza a **posição e estado** de cada barco  
✔️ Permite ver apenas os barcos **ativos e visíveis**

---

# Exemplo prático

- Se a simulação dura 3 segundos:
\`\`\`
BaseDados → frame 0 → frame 1 → frame 2
            barcos A, B      barcos A       barcos C
\`\`\`

- Cada barco (A, B, C) aparece apenas nos frames em que está ativo
- Com isso, podemos:
  - Atualizar posições
  - Voltar atrás no tempo
  - Guardar o estado de cada segundo

---

# Resumo

- `BaseDados` = lista ligada de **frames**
- `EntidadeIED` = lista ligada de **barcos no frame**
- Cada estrutura tem um papel claro:
  - `BaseDados`: o **passar do tempo**
  - `EntidadeIED`: o **estado dos barcos** no tempo

📌 Junta tudo: uma simulação realista e rastreável do radar náutico!
