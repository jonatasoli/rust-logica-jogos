#  Jogo da adivinhação

Vamos começar um novo jogo que é o jogo da adivinhação "Guessing Game" o objetivo desse jogo é identificar um número escolhido aleatóriamente. O jogo inicia com 1000 pontos para o
jogador e cada vez que ele erra o número é subtraido 100 pontos do placar dele quando o placar chegar a zero o jogo é encerrado.

## Regras

As regras são as seguintes:
- Ao iniciar o jogo o jogador tem a escolha de começar o jogo ou sair do jogo
- O jogador vai escolher um número entre 0 a 100
- Caso o jogador escolha um número fora desse intervalo será solicitado para ele escolher novamente
- Caso o jogador escolha uma letra ou um caractere especial também será solicitado para escolher o novamente
- Caso o jogador escolha um número menor que o número escolhido pelo jogo o jogo deve informar que o número escolhido foi menor
- Caso o jogador escolha um número maior que o número escolhido pelo jogo o jogo deve informar que o número escolhido foi maior
- Casa escolha que não seja o número escolhido pelo jogo deverá marcar um contador de erro
- O jogador começa com 1000 pontos caso aconteça um erro cada contador de erro deve subtrair 100 pontos
- Caso o jogador perca o jogo deverá ter um menu informando pra fechar o jogo ou jogar novamente
- Caso o jogador vença deverá mostrar o placar que ele obteve o a opção de sair do jogo ou tentar novamente.

## Começando o projeto

Vamos iniciar um novo projeto em nossa pasta projects

```bash
cd ~/projects
cargo new guessing_game
```

Agora para iniciar o nosso jogo vamos fazer o loop que já conhecemos e vamos criar o menu recebendo o input do usuário e imprimir na tela o valor escolhido e caso ele escolha
iniciar vamos imprimir que o jogo começou e caso ele sair nós vamos encerrar o jogo.

```rust
use std::io;

fn main() {
    loop {
        println!("Bem vindo ao jogo da adivinhação escolha uma das opções abaixo");
        println!("i - Iniciar o jogo");
        println!("q - Fechar o jogo");

        let mut escolha_str = String::new();
        let _ = io::stdin().read_line(&mut escolha_str);

        println!("A sua escolha foi {}", escolha_str);
        break;
    }

}
```

Aqui vamos mudar ao invés de usar números para opções vamos usar letras pois vamos precisar fazer um tratamento especial no código, estamos usando a captura que estavamos fazendo
anteriormente fazendo um println apenas no item escolhido, no final vamos dar um break apenas pra encerrar o loop.
Agora se rodarmos o código vamos ver que ele pegou a escolha que gostariamos e printou na tela.
```
cargo run
```

Certo agora vamos fazer um match com nossa escolha str só que como estamos usando letras vou forçar que o que venha de letras senha minuscula ou maiuscula que ele force sempre a
ser minúsculo.
```rust
use std::io;

fn main() {
    loop {
        println!("Bem vindo ao jogo da adivinhação escolha uma das opções abaixo");
        println!("i - Iniciar o jogo");
        println!("q - Fechar o jogo");

        let mut escolha_str = String::new();
        let _ = io::stdin().read_line(&mut escolha_str);

==
        match escolha_str.trim().to_lowercase().as_str() {
        };
==

    }
}
```

Criamos a nossa linha como `match escolha.str.trim().to_lowercase()` usando a função `trim()` para removermos espaços em branco e agora usamos uma nova função chamada
`to_lowercase()` que vai transformar nossa string caso tenha letras maiusculas em minúsculas.
Outra função que usamomos foi o `as_str` pois quando usamos o `trim` e o `to_lowercase` eles voltam um &str que é um tipo diferente do String então pra comparar vamos precisar
reconverter novamente para String e ai usamos o `as_str`.

Assim conseguimos agora colocar a comparação com a string "i" e a string "q".

```rust
use std::io;

fn main() {
    loop {
        println!("Bem vindo ao jogo da adivinhação escolha uma das opções abaixo");
        println!("i - Iniciar o jogo");
        println!("q - Fechar o jogo");

        let mut escolha_str = String::new();
        let _ = io::stdin().read_line(&mut escolha_str);

==
        match escolha_str.trim().to_lowercase().as_str() {
            "i" => {
                println!("Iniciar Jogo");
                continue;
            }
            "q" => {
                println!("Obrigado por jogar");
                break;
            }
            _ => {
                println!("Escolha inválida. Tente novamente.");
                continue;
            }
        };
==

    }
}
```

Aqui colocamos o "i" para imprimir e usamos o `continue` para voltar ao inicio do loop. No caso o jogador use "q" o programa vai ser encerrado.
Também usamos o coringa "_" caso seja dada outra opção que não seja "i" ou "q" nós colocamos a mensagem de erro e reiniciamos o loop.

Agora podemos testar e verificar se nossa função está correta.

## Diferença entre &str e String
Rust é uma linguagem de programação moderna que coloca um forte foco na segurança e no gerenciamento de memória, permitindo aos desenvolvedores escrever código seguro e eficiente. Duas estruturas de dados muito importantes em Rust são &str e String. Embora ambas sejam usadas para representar texto, elas têm diferenças fundamentais em termos de propriedades e uso. Vamos explorar as distinções entre &str e String em Rust.

&str - Referência para uma Sequência de Caracteres

&str é uma fatia (slice) que representa uma sequência de caracteres em Rust. Essa fatia é uma referência a uma sequência de caracteres armazenada em outro local da memória. Aqui estão algumas características importantes do &str:

    Imutável: O &str é imutável, o que significa que você não pode modificar o conteúdo da sequência de caracteres a que ele faz referência.

    Alocação Zero: O &str em si não aloca memória para a sequência de caracteres. Ele simplesmente aponta para uma sequência existente.

    View (Visão): O &str é uma visão de uma sequência de caracteres. Pode ser usado para referenciar substrings de uma String ou literais de string.

    Lifetime: O &str tem um tempo de vida (lifetime) que está vinculado ao contexto em que é criado. Isso garante que a referência seja válida durante o tempo necessário.

Aqui está um exemplo de &str:

```rust
fn main() {
    let texto: &str = "Olá, Mundo!";
    println!("{}", texto);
}

```


String - Propriedade de uma Sequência de Caracteres

String é uma estrutura de dados que representa uma sequência de caracteres alocada dinamicamente em Rust. Aqui estão algumas características importantes da String:

    Mutável: A String é mutável, o que significa que você pode modificar seu conteúdo, adicionando ou removendo caracteres.

    Alocação Dinâmica: A String aloca memória dinamicamente para armazenar a sequência de caracteres. Isso permite que você ajuste o tamanho conforme necessário.

    Proprietária: A String é proprietária, o que significa que é responsável por gerenciar a memória da sequência de caracteres que ela contém.

    Conversão: Você pode converter um &str em uma String usando a função to_string(), ou usar a função String::from().

Aqui está um exemplo de String:

```rust
fn main() {
    let mut texto: String = String::from("Olá, ");
    texto.push_str("Mundo!");
    println!("{}", texto);
}
```

Quando Usar &str e String

A escolha entre &str e String depende do contexto e dos requisitos do seu programa:

    Use &str quando precisar de uma referência imutável a uma sequência de caracteres existente. Por exemplo, ao passar argumentos de função ou realizar operações de leitura em uma sequência.

    Use String quando precisar de uma sequência de caracteres mutável que pode ser modificada. Por exemplo, para construir uma sequência de caracteres dinamicamente.

    Lembre-se de que &str e String são intercambiáveis por meio de conversões quando necessário.


## Alocação de memória em Rust
Rust é uma linguagem de programação conhecida por seu controle rigoroso sobre a memória. Ela oferece diversos tipos de memória com comportamentos distintos, o que é fundamental para garantir a segurança e o desempenho dos programas. Vamos explorar os principais tipos de memória em Rust e como eles se comportam.

#### 1. Stack (Pilha)

A pilha, ou stack, é um local de armazenamento de memória de curto prazo e é usada para alocar variáveis locais e controlar a execução do programa. Aqui estão algumas características da pilha:

* Alcance Limitado: As variáveis alocadas na pilha têm um tempo de vida limitado e são desalocadas automaticamente quando saem do escopo.
* Alocação Rápida: A alocação e liberação de memória na pilha é rápida, pois segue uma ordem rigorosa de LIFO (último a entrar, primeiro a sair).
* Tamanho Conhecido em Tempo de Compilação: O tamanho das variáveis alocadas na pilha deve ser conhecido em tempo de compilação.

Exemplo de alocação na pilha:

```rust
fn main() {
    let x = 42; // Variável "x" alocada na pilha
}
```

#### 2. Heap

O heap é um local de armazenamento de memória de longo prazo, usado para alocar dados cujo tamanho não é conhecido em tempo de compilação e/ou que precisam de tempo de vida mais longo. Aqui estão algumas características do heap:

* Alcance Mais Amplo: Os dados alocados no heap podem ter um tempo de vida mais longo e persistir além do escopo atual.
* Alocação e Liberação Controladas: A alocação e liberação de memória no heap são controladas manualmente pelo programador, usando funções como Box::new, Vec::new, etc.

Exemplo de alocação no heap:

```rust
fn main() {
    let x = Box::new(42); // Variável "x" alocada no heap
}
```

#### 3. Memória Estática

A memória estática é usada para armazenar dados que têm um tempo de vida durante toda a execução do programa. Ela é alocada em tempo de compilação e não pode ser liberada durante a execução.

* Tempo de Vida Global: Os dados estáticos têm um tempo de vida global e existem durante toda a execução do programa.
* Alocação em Tempo de Compilação: A memória estática é alocada em tempo de compilação e não pode ser liberada ou realocada.

Exemplo de alocação de memória estática:

```rust
static HELLO: &str = "Hello, World!";
```

#### 4. String vs &str

Rust distingue entre String e &str. String é uma sequência de caracteres alocada no heap, que permite modificações. &str é uma referência a uma sequência de caracteres (geralmente String ou literal de string) e é imutável.

* Use String quando precisar de uma sequência de caracteres que pode ser modificada.
* Use &str para referenciar sequências de caracteres imutáveis.

```rust
fn main() {
    let s1: String = String::from("Hello");
    let s2: &str = "World";
}
```


## Criando a função do jogo

Agora vamos criar uma função onde vamos manter nossa lógica do jogo para isso vamos usar a palavra reservada fn
```rust
fn game() -> () {
    println!("Iniciar Jogo");
}
```
Com isso movemos nosso print iniciar jogo para dentro da função e vamos ver que vai continuar funcionando vale notar que na função nós anotamos `()` que quer dizer que a função vai
retornar uma Option vazia ou seja se for OK vão vai ter valor algum isso faz a função main que chama a função game saber que essa função não tem retorno se nós tentarmos receber
algum valor de game nós vamos receber a Option porém ela vai ver sem nenhum valor, com isso nós nunca vamos receber um valor Nulo no máximo um Option com um Ok porém não existe um
valor empty ou None isso é uma caracteristica do rust para trabalhar sem usar valores nulos.
Agora quero que nosso jogo defina o número secreto, nesse momento vamos definir um número fixo, mais a frente vamos fazer esse número ser aleatório, também vamos receber a
pontuação do jogador e vamos já contar um erro e o fim do jogo.

```rust
use std::io;

fn main() {
    loop {
        println!("Bem vindo ao jogo da adivinhação escolha uma das opções abaixo");
        println!("i - Iniciar o jogo");
        println!("q - Fechar o jogo");

        let mut escolha_str = String::new();
        let _ = io::stdin().read_line(&mut escolha_str);

        match escolha_str.trim().to_lowercase().as_str() {
            "i" => {
                ==
                let mut _pontuacao: u16 = 1000;
                let _numero_alvo: u8 = 42;
                game(pontuacao=_pontuacao, numero=_numero_alvo);
                ==
                continue;
            }
            "q" => {
                println!("Obrigado por jogar");
                break;
            }
            _ => {
                println!("Escolha inválida. Tente novamente.");
                continue;
            }
        };

    }
}


fn game(pontuacao: u16, numero: u8) -> () {
    println!("Iniciar Jogo");
    ==
    pontuacao = pontuacao - 100;
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero)
    ==
}
```

Se tentarmos compilar vamos receber o erro abaixo:

```bash
❮ cargo run
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
error[E0384]: cannot assign to immutable argument `pontuacao`
  --> src/main.rs:35:5
   |
33 | fn game(pontuacao: u16, numero: u8) -> () {
   |         --------- help: consider making this binding mutable: `mut pontuacao`
34 |     println!("Iniciar Jogo");
35 |     pontuacao = pontuacao - 100;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^ cannot assign to immutable argument

For more information about this error, try `rustc --explain E0384`.
error: could not compile `guessing_game` (bin "guessing_game") due to previous error
```

Essa mensagem diz que pontuação dentro de game é um atributo imutável então precisamos deixar nosso parametro mutável. então simplesmente vamos usar um mut no cabeçalho da função
game.

```rust
fn game(mut pontuacao: u16, numero: u8) -> () {
...
```

Agora se rodarmos vai voltar o resultado que gostariamos.

```bash
Bem vindo ao jogo da adivinhação escolha uma das opções abaixo
i - Iniciar o jogo
q - Fechar o jogo
i
Iniciar Jogo
A sua pontuação foi 900, e o número era 42
...
```

Agora vamos mudar um pouco queremos que nosso print do resultado também seja impresso depois que o loop do game acabar então vamos copia-lo pra fora da função.

```rust
use std::io;

fn main() {
    loop {
        println!("Bem vindo ao jogo da adivinhação escolha uma das opções abaixo");
        println!("i - Iniciar o jogo");
        println!("q - Fechar o jogo");

        let mut escolha_str = String::new();
        let _ = io::stdin().read_line(&mut escolha_str);

        match escolha_str.trim().to_lowercase().as_str() {
            "i" => {
                let mut _pontuacao: u16 = 1000;
                let _numero_alvo: u8 = 42;
                game(_pontuacao, _numero_alvo);
                ==
                println!("A sua pontuação foi {}, e o número era {}", _pontuacao, _numero_alvo);
                ==
                continue;
            }
            "q" => {
                println!("Obrigado por jogar");
                break;
            }
            _ => {
                println!("Escolha inválida. Tente novamente.");
                continue;
            }
        };

    }
}
```

Agora vamos receber essa saida
```bash
➜ cargo run
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 0.09s
     Running `target/debug/guessing_game`
Bem vindo ao jogo da adivinhação escolha uma das opções abaixo
i - Iniciar o jogo
q - Fechar o jogo
i
Iniciar Jogo
A sua pontuação foi 900, e o número era 42
A sua pontuação foi 1000, e o número era 42
```

O que aconteceu?
Acontece que do jeito que está a função game está recebendo uma cópia dos valores de _pontuacao e _numero_alvo ou seja o valor reduzido de 900 só existe dentro da função game
quando a função termina o rust limpa as variáveis do escopo de game poderiamos facilmente resolver isso fazendo com que game retorne o valor de 900 para nossa variável _pontuacao
mas, podemos resolver isso sem precisar duplicar os valores dentro da função passando a referência delas através de Borrowing que é o que vamos discutir a seguinte.



## Ownership e Borrowing

Rust introduz o conceito de "ownership" (propriedade) e "borrowing" (empréstimo) para gerenciar a memória de forma segura. Isso implica que, em Rust, você precisa seguir regras rigorosas para acessar e modificar a memória. A ideia principal é que um recurso só pode ser possuído por uma única parte do código em um determinado momento.

* Propriedade (Ownership): Uma variável é a "dona" de um recurso e é responsável por liberá-lo quando não for mais necessário.
* Empréstimo (Borrowing): Outras partes do código podem "emprestar" acesso à variável, mas não podem modificar a propriedade.

Assim sendo no nosso caso particular podemos pedir pro rust nos dar as referências das variáveis _pontuacao e _numero_alvo assim sendo ele não cria uma nova variável `numero` e
`pontuacao` ele vai simplesmente pegar a referencia onde está armazenado os valores de _pontuacao e _numero_alvo e começar a apontar para os parametros que existem na função assim
quando a função terminar ela vai devolver as referências para os parametros originais.

```
use std::io;

fn main() {
    loop {
        println!("Bem vindo ao jogo da adivinhação escolha uma das opções abaixo");
        println!("i - Iniciar o jogo");
        println!("q - Fechar o jogo");

        let mut escolha_str = String::new();
        let _ = io::stdin().read_line(&mut escolha_str);

        match escolha_str.trim().to_lowercase().as_str() {
            "i" => {
                let mut _pontuacao: u16 = 1000;
                let _numero_alvo: u8 = 42;
                ==
                game(&mut _pontuacao, &_numero_alvo);
                ==
                println!("A sua pontuação foi {}, e o número era {}", _pontuacao, _numero_alvo);
                continue;
            }
            "q" => {
                println!("Obrigado por jogar");
                break;
            }
            _ => {
                println!("Escolha inválida. Tente novamente.");
                continue;
            }
        };

    }
}


==
fn game(pontuacao: &mut u16, numero: &u8) -> () {
==
    println!("Iniciar Jogo");
    ==
    *pontuacao -= 100;
    ==
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero)
}
```
Aqui fizemos algumas alterações a primeira é que passamos na variável o simbolo "&" que indica que estamos emprestando a referência para a função ou seja ela vai ser
temporáriamente a dona dos parametros passados e no caso de pontuação nós passamos como &mut que quer dizer que ela pode ser modificada, caso fosse passado apenas om o & comercial
a função game só teria a permissão de ler o parametro e não modificalo.
```rust
fn game(pontuacao: &mut u16, numero: &u8) -> () {
```
No cabeçalho da função mudamos também indicando que pontuação é a referencia mutavel de um u16 e a referencia de u8 assim na compilação ele sabe que a função está trabalhando com
referências e não vai criar uma cópia da função.

Por ultimo vamos fazer uma alteração na nossa operação de subtração
```rust
    *pontuacao -= 100;
```
Usamos o simbilo "*" para indicar que não queremos mexer na referência onde está pontuacao mas, no valor que ele possui assim o valor que estava em _pontuacao mudou de 1000 para
900.

Agora com isso conseguimos compreender as linhas onde capturamos a entrada do teclado do jogador
```rust
        let mut escolha_str = String::new();
        let _ = io::stdin().read_line(&mut escolha_str);
```

Onde criamos uma variável escolha_str que é uma String vazia e mutável e quando chamamos a função read_line nós passamos a referência mutável de escolha_str e enquanto ela está em
execução ela está alterando o valor do `escolha_str` para nós e quando termina conseguimos usar o valor de escolha_str com os valores modificados pela função `read_line` sem
precisar duplicar a variável dentro da função. 
É importante reforçar que em muitas linguagens não conseguimos fazer isso nós normalmente precisamos receber a copia modificada dentro da função para conseguir trabalhar. Essa
característica do rust é muito importante para casos que trabalhamos com pouca memória ou mesmo um jogo onde quanto menos recursos usarmos mais leve será nosso jogo.

## Introduzindo testes ao nosso código


## Criando nossa função do jogo

## Segurança de Memória

Rust fornece uma série de garantias de segurança de memória durante o tempo de compilação. Essas garantias são fundamentais para evitar erros comuns, como vazamentos de memória, referências nulas e acessos inválidos.

* Sem Referências Nulas: Rust garante que as referências não sejam nulas, eliminando muitos erros de acesso nulo.
* Sem Vazamentos de Memória: Rust controla rigorosamente o ciclo de vida dos recursos, o que impede vazamentos de memória.
* Sem Concorrência de Dados Mutáveis: Rust impõe regras rigorosas para evitar a concorrência de dados mutáveis, garantindo a segurança em threads.


