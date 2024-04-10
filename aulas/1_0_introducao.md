# Introdução

Bem vindo ao curso de Rust lógica com jogos, você vai aprender:
- Como fazer esse curso?
- O que é Rust?
- Principais características do Rust
- Instalação do Rust
- Configuração do editor
- Principios básicos de um jogo eletrônico
- O que é GDD?
WIP

## Como fazer esse curso?

Para inicio você pode assistir um vídeo meu [sobre meu método de estudo](https://youtu.be/XCIqvx98iFI) mas, resumidamente:
- Monte um cronograma
- Veja o conteúdo
- Faça os exercicios sugeridos
- Use os exercícios sugeridos como uma revisão do conteúdo

## O que é Rust?
Nos últimos anos, a linguagem de programação Rust tem ganhado destaque no cenário de desenvolvimento de software. Criada pela Mozilla Research e lançada em 2010, Rust é uma linguagem de programação de sistema que se destaca por sua segurança, performance e facilidade de uso.

## Principais características do Rust
### Segurança

Um dos principais atrativos de Rust é sua forte ênfase na segurança. Ao combinar uma rigorosa verificação de tipos em tempo de compilação com um sistema de gerenciamento de memória sem garbage collector, Rust elimina muitas das classes comuns de bugs que assolam outras linguagens, como corrupção de memória, vazamentos de memória e race conditions.

O sistema de tipos de Rust é projetado para capturar erros em tempo de compilação que poderiam levar a falhas de segurança em tempo de execução, como acessos inválidos à memória ou uso indevido de ponteiros. Isso é possível graças a recursos exclusivos, como o conceito de propriedade (ownership) e empréstimos (borrowing), que garantem que os recursos de memória sejam gerenciados de forma segura durante toda a vida útil do programa.

### Performance

Além de sua forte ênfase na segurança, Rust também é conhecida por sua excelente performance. Ao fornecer controle de baixo nível sobre os recursos de hardware, como gerenciamento de memória e concorrência, Rust permite que os desenvolvedores escrevam código altamente eficiente que rivaliza com linguagens de sistema tradicionais, como C e C++, sem sacrificar a segurança.

A abordagem única de Rust para a concorrência, baseada em suas garantias de segurança em tempo de compilação, também torna mais fácil escrever código concorrente que é livre de race conditions e deadlock, enquanto ainda aproveita ao máximo o poder do hardware moderno.

## Instalação do Rust

Para instalar o rust simplesmente abra seu terminal ou prompt de commando e cole o código abaixo:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Para windows `chocolatey`:
```bash
choco install rust

```

Para mac (Homebrew):
```bash
brew install rustup
```

## Configuração do editor
Isso varia de acordo com o editor que você quer usar vou por aqui algumas sugestões:
- NeoVim (WIP)
- [Helix](https://youtu.be/MURMkIlCHRg)
- [Emacs](https://www.youtube.com/watch?v=CvKywSV3fiI&list=PLOQgLBuj2-3I7w8JQvCY8lbbrUZL-gf4m)

## Principios básicos de um jogo eletrônico

Os jogos eletrônicos são formas de entretenimento interativo que envolvem os jogadores em experiências virtuais através de dispositivos eletrônicos, como consoles de videogame, computadores e dispositivos móveis. Eles abrangem uma ampla variedade de gêneros, desde jogos de ação e aventura até quebra-cabeças e jogos de simulação.

### Princípios Básicos dos Jogos Eletrônicos

1. Objetivo
Todos os jogos têm um objetivo ou um conjunto de objetivos que os jogadores devem alcançar para progredir ou vencer o jogo. Isso pode incluir coletar itens, derrotar inimigos, resolver quebra-cabeças ou alcançar uma pontuação específica.

2. Regras
Os jogos também têm regras que definem o funcionamento do jogo e o que os jogadores podem e não podem fazer. Essas regras podem incluir limites de tempo, restrições de movimento, condições de vitória e derrota, entre outras.

3. Interatividade
Um dos aspectos mais distintivos dos jogos eletrônicos é sua interatividade. Os jogadores têm a capacidade de interagir com o mundo do jogo de várias maneiras, como mover personagens, tomar decisões, resolver quebra-cabeças e muito mais.

4. Feedback
Os jogos fornecem feedback aos jogadores para informá-los sobre seu desempenho e progresso no jogo. Isso pode incluir efeitos visuais, sons, pontuações e mensagens na tela que indicam se uma ação foi bem-sucedida ou não.

5. Desafio
Os jogos são projetados para desafiar os jogadores e oferecer uma experiência gratificante à medida que eles superam obstáculos e alcançam seus objetivos. O equilíbrio entre desafio e habilidade é fundamental para manter os jogadores envolvidos e motivados.

6. Imersão
A imersão é a capacidade dos jogos de envolver os jogadores em um mundo virtual convincente. Isso pode ser alcançado por meio de gráficos realistas, trilha sonora envolvente, narrativa cativante e mecânicas de jogo envolventes.

7. Progressão
Os jogos geralmente apresentam um sistema de progressão que permite aos jogadores avançar no jogo e desbloquear novos conteúdos, como níveis, personagens, habilidades e itens, à medida que progridem.


## O que é GDD?
O Guia de Design de Jogo (GDD) é um documento crucial no desenvolvimento de jogos, servindo como um mapa do tesouro para os criadores de jogos.

Um Guia de Design de Jogo (GDD) é um documento detalhado que descreve todos os aspectos de um jogo, desde sua concepção inicial até sua implementação final. Ele serve como um guia abrangente para todos os membros da equipe de desenvolvimento de jogos, fornecendo uma visão clara e coesa do que o jogo será e como ele será criado.

O GDD pode ser super detalhado ou apenas com os pontos principais do jogo, o importante que usamos ele como guia.
