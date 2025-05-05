import matplotlib.pyplot as plt
import sys

def desenhar_radar(tamanho, barcos):
    """Desenha o radar com os barcos fornecidos."""
    plt.figure(figsize=(10, 10))
    
    # Desenha os barcos
    for barco, x, y in barcos:
        plt.scatter(x, y, label=f'{barco}', s=100)
        plt.text(x, y, barco, fontsize=12, ha='right', va='bottom')
    
    # Configurações do gráfico
    plt.xlim(0, tamanho)
    plt.ylim(0, tamanho)
    plt.xticks(range(0, tamanho+1, tamanho//10))
    plt.yticks(range(0, tamanho+1, tamanho//10))
    plt.grid(True, linestyle='--', alpha=0.5)
    plt.title('Radar de Barcos')
    plt.xlabel('Colunas')
    plt.ylabel('Linhas')
    plt.legend()
    plt.show()

# Ler parâmetros da linha de comando
if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Uso: python desenha_radar.py (tamanhoXxY) (barco, X, Y) ...")
        sys.exit(1)
    
    tamanho = int(sys.argv[1].split('x')[0])
    barcos = []
    for arg in sys.argv[2:]:
        partes = arg.strip('()').split(',')
        barco = partes[0].strip()
        x = int(partes[1])
        y = int(partes[2])
        barcos.append((barco, x, y))
    
    desenhar_radar(tamanho, barcos)
