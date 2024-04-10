# Jogo Blackjack

Bom hoje vamos começar analisando sobre o jogo do blackjack.

O Blackjack, também conhecido como 21, é um jogo de cartas popular jogado em cassinos. Aqui estão as regras básicas:

* Objetivo do Jogo:
  *  O objetivo é obter uma mão com um valor total mais próximo possível de 21, sem ultrapassar esse valor.

* Cartas e Valores:
  *  As cartas de 2 a 10 valem seu valor nominal.
  *  Valetes(J), Damas(Q) e Reis(K) valem cada um 10 pontos.
  *  As cartas de Ás(A) podem valer 1 ou 11, dependendo da situação.

* Início do Jogo:
  *  O jogador e o dealer recebem duas cartas no início.
  *  O jogador vê uma das cartas do dealer.

* Jogada do Jogador:
  *  O jogador decide entre "pedir" (receber uma carta) ou "ficar" (manter a mão atual).
  *  Se o valor da mão do jogador ultrapassar 21, ele perde automaticamente.

* Jogada do Dealer:
  *  Após a vez do jogador, o dealer revela sua segunda carta.
  *  O dealer deve continuar a pedir cartas até que a mão alcance pelo menos 17 pontos.

* Determinação do Vencedor:
  *  Se a mão do jogador ultrapassar 21, ele perde automaticamente.
  *  Se o dealer ultrapassar 21, o jogador vence.
  *  Se nenhum dos jogadores ultrapassar 21, o vencedor é aquele com a mão mais próxima de 21.

* Blackjack:
  *  Se um jogador receber um Ás e uma carta de 10 pontos no início (um Blackjack), ele geralmente vence automaticamente, a menos que o dealer também tenha um Blackjack.

* Empate:
  *  Se o jogador e o dealer tiverem o mesmo valor de mão, o jogo é um empate ("push").

Em um empate (ou "push") no Blackjack, significa que a pontuação total da mão do jogador é a mesma que a pontuação total da mão do dealer. Nesse cenário:

* Nenhum Vencedor ou Perdedor:
  *  Como as pontuações são iguais, nenhum jogador ganha ou perde.
  *  O dinheiro apostado geralmente é devolvido aos jogadores.

* Mão Empurrada (Push):
  *  Às vezes, é chamado de "push" quando não há vencedor ou perdedor.
  *  Isso não afeta a pontuação ou saldo dos jogadores.

* Nova Rodada:
  *  Após um empate, o jogo geralmente avança para uma nova rodada.
  *  Os jogadores podem fazer novas apostas e iniciar uma nova mão.

O empate é uma ocorrência comum no Blackjack e faz parte do jogo. É importante observar que, em alguns casos, as regras do cassino podem variar, e algumas variações do jogo podem ter regras específicas para empates. Ao jogar em um cassino ou seguir regras específicas, é sempre bom estar ciente das políticas e procedimentos locais.

Essas são as regras básicas do Blackjack. Estratégias avançadas podem ser aplicadas, considerando as cartas já distribuídas, mas essas são as regras fundamentais para começar a jogar.


# Raio X - Jogo Blackjack
Guia de Design de Jogo (GDD) - Blackjack

1. Visão Geral do Jogo:

O jogo de Blackjack é uma versão digital do popular jogo de cartas de cassino, também conhecido como 21. Os jogadores competem contra o dealer (a casa) para alcançar uma mão de cartas com um valor total próximo de 21, sem ultrapassá-lo. O objetivo é vencer o dealer sem estourar, o que resultaria em uma perda imediata.

2. Mecânicas de Jogo:

    Distribuição de Cartas: Os jogadores recebem duas cartas viradas para cima, enquanto o dealer recebe uma carta virada para cima e uma carta virada para baixo.

    Tomada de Decisão: Os jogadores têm a opção de "bater" (receber outra carta), "ficar" (manter sua mão atual), "dobrar" (dobrar sua aposta e receber exatamente uma carta adicional) ou "dividir" (dividir sua mão em duas mãos separadas, se as duas primeiras cartas tiverem o mesmo valor).

    Regras de Vitória e Derrota: O jogador ganha se sua mão totalizar mais perto de 21 do que a do dealer sem ultrapassar. Se o jogador ultrapassar 21, ele perde automaticamente. Se a mão do dealer ultrapassar 21 e a do jogador não, o jogador vence.

3. Elementos do Jogo:

    Baralho de Cartas: Um baralho padrão de 52 cartas é usado, sem coringas.

    Aposta: Os jogadores podem apostar uma quantidade de fichas antes do início de cada rodada.

    Interface do Usuário: Uma interface de usuário intuitiva permitirá que os jogadores interajam com o jogo, fazendo escolhas de jogo e visualizando suas mãos e a mão do dealer.

4. Arte e Design Visual:

    Design da Tela: O layout da tela será simples e feito via terminal mostrando a informação das cartas usando seus respectivos caracteres.

    Estilo Visual: Estilo de jogos feitos unicamente para terminal sem nenhum arte especifica.

6. Considerações Técnicas:

    Plataforma: O jogo será desenvolvido para funcionar em desktops, dispositivos móveis e navegadores da web.

    Tecnologia: Será utilizado o framework de desenvolvimento de jogos Bevy, que oferece suporte robusto para gráficos 2D e áudio.


## Iniciando o jogo

Bom vamos criar o nosso jogo.

```bash
cargo new blackjack
```

Agora vamos criar na nossa main o menu principal do jogo.
