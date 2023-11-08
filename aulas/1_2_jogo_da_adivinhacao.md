#  Jogo da adivinhação Raio-x

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


## Introdução sobre testes de software

A programação é uma tarefa complexa que envolve a criação de software que seja confiável, eficiente e livre de erros. À medida que os projetos de desenvolvimento de software crescem em complexidade, torna-se cada vez mais crítico garantir a qualidade do código. Uma das abordagens mais eficazes para assegurar a qualidade do software é a prática de testes, especialmente o Desenvolvimento Orientado a Testes (TDD).

Então vamos agora explorar sobre a importância dos testes na programação e como o TDD pode ser uma ferramenta valiosa para alcançar um código mais robusto e confiável. Vamos mergulhar no mundo dos testes e entender por que eles são essenciais para qualquer desenvolvedor de software.

Os testes desempenham um papel fundamental no processo de desenvolvimento de software por várias razões:

* Detecção Precoce de Erros: Os testes permitem que os desenvolvedores identifiquem e corrijam erros em um estágio inicial do desenvolvimento, economizando tempo e recursos no longo prazo.
* Manutenção Simplificada: Um código bem testado é mais fácil de manter. Quando novos recursos são adicionados ou modificações são feitas, os testes garantem que as funcionalidades existentes continuem funcionando conforme o esperado.
* Redução de Bugs em Produção: Testar seu código ajuda a evitar que bugs cheguem aos usuários finais, resultando em uma melhor experiência do cliente e economizando custos associados à correção de problemas em produção.
* Documentação Automática: Testes bem escritos funcionam como documentação viva do seu código. Eles descrevem como as diferentes partes do software devem se comportar.
* Confiança no Código: Testar seu código cria confiança tanto para os desenvolvedores quanto para os usuários. Saber que o software passou em uma bateria de testes proporciona tranquilidade.

#### Desenvolvimento Orientado a Testes (TDD)

O Desenvolvimento Orientado a Testes (TDD) é uma abordagem de desenvolvimento que enfatiza a escrita de testes antes de escrever o código real. O ciclo TDD segue três passos simples: "Red-Green-Refactor."

* Red (Vermelho): Neste estágio, você escreve um teste que descreve a funcionalidade que deseja implementar. Como você ainda não escreveu o código, o teste falhará.
* Green (Verde): Agora, você escreve o código mínimo necessário para fazer o teste passar. O objetivo é fazer o teste passar o mais rápido possível.
* Refactor (Refatorar): Com o teste passando, você pode refatorar o código para torná-lo mais limpo, eficiente e legível.

O TDD oferece inúmeras vantagens, incluindo:

* Maior Qualidade do Código: TDD incentiva a escrita de código de alta qualidade desde o início.
* Projeto Centrado no Usuário: Testes escritos com base nos requisitos do usuário garantem que o software atenda às expectativas.
* Facilidade de Manutenção: O código resultante do TDD é mais fácil de manter, pois as mudanças não quebram as funcionalidades existentes.
* Confiança nas Mudanças: TDD permite que os desenvolvedores façam alterações no código com confiança, sabendo que os testes irão detectar problemas.
* Feedback Rápido: TDD fornece feedback imediato, acelerando o processo de desenvolvimento.

A importância dos testes na programação não pode ser subestimada. Eles desempenham um papel crítico na criação de software de alta qualidade, confiável e seguro. O Desenvolvimento Orientado a Testes (TDD) é uma abordagem valiosa que torna os testes uma parte integrante do processo de desenvolvimento, resultando em um código mais robusto e confiável.

Para os desenvolvedores, a prática de testes e o uso do TDD representam um investimento que se traduz em economia de tempo, redução de custos e satisfação do cliente. À medida que a indústria de software continua a evoluir, a cultura de testes se torna cada vez mais fundamental para o sucesso de projetos de desenvolvimento de software.

Portanto, da próxima vez que você começar a escrever código, lembre-se da importância dos testes e considere adotar o Desenvolvimento Orientado a Testes como parte integrante do seu processo de desenvolvimento. A qualidade do seu software agradecerá.

## Introduzindo testes ao nosso código

Agora vamos abrir nosso arquivo test_game_loop.rs, esse teste vai ser usado para testarmos nossas condições do jogo então vamos criar um primeiro teste para validar a condição que
está fixa hoje.
Vamos adicionar o código abaixo no final do nosso main.rs

```rust
#[test]
fn test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;

    // Act
    game(&mut pontuacao, &numero)

    // Assert
    assert_eq!(pontuacao, 900)
}

```

Inicialmente precisamos adicionar uma anotação _annotattion_ `#[test]` as anotações são colocadas no inicio de uma função/módulo/trait para adicionar alguma funcionalidade aquele
bloco de código.
NO nosso caso estamos adicionando uma funcionalidade de teste para nossa função de teste `test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral` assim podemos rodar o
comando de teste `cargo test`.
Nossa estrutura de testes é divida em 3 partes:
- Arrange -> que é os dados que precisamos preparar para o teste
- Act -> Execução do código que queremos testas
- Assert -> Que é o que esperamos que aconteça depois do código sendo executado.

No caso do assert executamos uma macro nova que é o `assert_eq!` sua função é comprar dois valores caso sejam iguais ele termina corretamente, caso sejam diferentes ele vai voltar
um erro no nosso teste, vamos primeiro rodar o teste do jeito que está.

```bash
cargo test
```
Você deve ter um retorno parecido com esse:
```bash
➜ cargo test
    Finished test [unoptimized + debuginfo] target(s) in 0.00s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Vale destacar alguns pontos:
```bash
➜ cargo test
    Finished test [unoptimized + debuginfo] target(s) in 0.00s
    {==
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)
     ==}

running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```
Aqui mostra onde foi compilado o teste


```bash
➜ cargo test
    Finished test [unoptimized + debuginfo] target(s) in 0.00s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

    {==
running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok
     ==}

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Nessas linhas mostram quantos testes rodaram, o nome do teste que rodou e se foi ok ou não

```bash
➜ cargo test
    Finished test [unoptimized + debuginfo] target(s) in 0.00s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok

    {==
test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
     ==}
```

Nessa linha temos um pequeno relatório dos testes quando passaram quantos derram erro e por ai vai, além de tudo mostra o tempo que demorou pra rodar os testes.

Agora vamos mudar nosso teste para ele falhar

```rust
#[test]
fn test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;

    // Act
    game(&mut pontuacao, &numero);

    // Assert
    ==assert_eq!(pontuacao, 0)==
}
```

Agora temos uma saída diferente

```bash
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
    Finished test [unoptimized + debuginfo] target(s) in 0.12s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... FAILED

failures:

---- test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral stdout ----
{==
Iniciar Jogo
A sua pontuação foi 900, e o número era 42
thread 'test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral' panicked at src/main.rs:51:5:
assertion `left == right` failed
  left: 900
 right: 0
==}
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace


{==
failures:
    test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral

test result: FAILED. 0 passed; 1 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
==}

error: test failed, to rerun pass `--bin guessing_game`

```
É importante não ter medo de ler toda a mensagem mesmo que seja grande pois com ela podemos ver o problema.

Veja que agora ele mostra a saida da execução de game, no caso ele vai mostrar os dois prints que criamos depois ele vai mostrar o erro do assertion mostrando que o valor de
pontuação foi 900 e o valor da direita foi 0 então sabemos quanto nossa variavel retornou e o valor da comparação.

Também podemos ver que agora no nosso relatório temos um teste como failed pois o teste falhou.

Vamos agora voltar nosso teste para passar novamente e rodar os testes.

```bash
❯ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
    Finished test [unoptimized + debuginfo] target(s) in 0.13s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Certo agora podemos continuar trabalhando no jogo.

## Adicionando o chute do jogador

Agora vamos adicionar a captura da entrada do jogador para e vamos passar o valor para nossa função game.
```rust
fn game(pontuacao: &mut u16, numero: &u8) -> () {
    {==
    println!("Por favor digite o número que você acredita ser");
    let mut chute = String::new();
    let _ = io::stdin().read_line(&mut chute);
    ==}
    *pontuacao -= 100;
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero)
}
```
Se rodarmos nosso teste ele ainda vai passar.

```bash
➜  cargo test
    Finished test [unoptimized + debuginfo] target(s) in 0.00s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Agora vamos fazer algumas alterações vamos criar uma nova função que vai atualizar a pontuação. Mas primeiro vamos mudar nosso teste para verificar com a função
_check_win_condition_ e passar mais um parametro chamado chute que vai ser um inteiro também.

```rust
#[test]
fn test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 1;

    // Act
    check_win_conditition(&mut pontuacao, &numero);

    // Assert
    assert_eq!(pontuacao, 900)
}
```
Vamos receber agora um erro de compilação

```bash
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
error[E0425]: cannot find function `check_win_conditition` in this scope
  --> src/main.rs:55:5
   |
55 |     check_win_conditition(&mut pontuacao, &numero, &chute);
   |     ^^^^^^^^^^^^^^^^^^^^^ not found in this scope

For more information about this error, try `rustc --explain E0425`.
error: could not compile `guessing_game` (bin "guessing_game" test) due to previous error
```

É importante sempre ler a mensagem de erro e tentar entender também sempre que quiser poder rodar o `--explain` para ver a descrição do erro.
```bash
rustc --explain E0425
```

Nesse caso o erro é que check_win_conditition não existe dentro  do escopo isso por que ele não foi criado, vamos então cria-lo e mover o código responsável por diminuir a
pontuação.

```rust
fn game(pontuacao: &mut u16, numero: &u8) -> () {
    println!("Por favor digite o número que você acredita ser");
    let mut chute = String::new();
    let _ = io::stdin().read_line(&mut chute);
}

fn check_win_coditition(pontuacao: &mut u16, numero: &u8, chute: &u8) -> () {
    *pontuacao -= 100;
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero)
}
```

Se rodarmos o teste ele vai funcionar com um warning que logo vamos remove-lo.
```bash
❯ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
warning: unused variable: `pontuacao`
  --> src/main.rs:33:9
   |
33 | fn game(pontuacao: &mut u16, numero: &u8) -> () {
   |         ^^^^^^^^^ help: if this is intentional, prefix it with an underscore: `_pontuacao`
   |
   = note: `#[warn(unused_variables)]` on by default

warning: unused variable: `numero`
  --> src/main.rs:33:30
   |
33 | fn game(pontuacao: &mut u16, numero: &u8) -> () {
   |                              ^^^^^^ help: if this is intentional, prefix it with an underscore: `_numero`

warning: unused variable: `chute`
  --> src/main.rs:39:59
   |
39 | fn check_win_coditition(pontuacao: &mut u16, numero: &u8, chute: &u8) -> () {
   |                                                           ^^^^^ help: if this is intentional, prefix it with an underscore: `_chute`

warning: `guessing_game` (bin "guessing_game" test) generated 3 warnings (run `cargo fix --bin "guessing_game" --tests` to apply 3 suggestions)
    Finished test [unoptimized + debuginfo] target(s) in 0.15s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

O principal ponto desse warnings é que não estamos usando várias variaveis vamos ajusta-las. Primeiro precisamos converter nossa variavel chute para int.

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
            {==
            "i" => {
                game();
                continue;
            }
            ==}
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

{==
fn game() -> () {
    println!("Por favor digite o número que você acredita ser");
    let mut pontuacao: u16 = 1000;
    let numero_alvo: u8 = 42;
    let mut chute = String::new();
    let _ = io::stdin().read_line(&mut chute);

    let chute: u8 = match chute.trim().parse() {
        Ok(num) => num,
        Err(_) => { 
            println!("Valor não é válido ou não está entre 0 e 255");
            0
        }
    };
    check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero_alvo);
}

fn check_win_coditition(pontuacao: &mut u16, numero: &u8, chute: &u8) -> () {
    *pontuacao -= 100;
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero)
}
==}



#[test]
fn test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 1;

    // Act
    check_win_coditition(&mut pontuacao, &numero, &chute);

    // Assert
    assert_eq!(pontuacao, 900)
}

```

Temos algumas mudanças aqui, precisamos mover pontuacao e numero_alvo para dentro da função game, pois não podemos reimprestar  pontuacao para _verify_win_conditition_ essa é uma
caracteristica do rust então jogamos tudo para a função game deixando a main apenas para menu.
Também fizemos o match abaixo para converter a entrada  string para u8 e com isso temos um efeito colateral que precisamos voltar um número que no caso é 0.
```rust
    let chute: u8 = match chute.trim().parse() {
        Ok(num) => num,
        Err(_) => { 
            println!("Valor não é válido ou não está entre 0 e 255");
            0
        }
    };
```

Agora vamos rodar nosso teste.

```bash
❯ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
warning: unused variable: `chute`
  --> src/main.rs:48:59
   |
48 | fn check_win_coditition(pontuacao: &mut u16, numero: &u8, chute: &u8) -> () {
   |                                                           ^^^^^ help: if this is intentional, prefix it with an underscore: `_chute`
   |
   = note: `#[warn(unused_variables)]` on by default

warning: `guessing_game` (bin "guessing_game" test) generated 1 warning (run `cargo fix --bin "guessing_game" --tests` to apply 1 suggestion)
    Finished test [unoptimized + debuginfo] target(s) in 0.13s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

```

Vamos agora remover o ultimo warning e vamos começar a usar nosso parametro chute.

```rust
fn check_win_coditition(pontuacao: &mut u16, numero: &u8, chute: &u8) -> () {
    {==
    if chute < numero {
        *pontuacao -= 100;
    }
    ==}
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero)
}
```

Assim agora apenas se o número for menor que o número a pontuação vai mudar. Vamos rodar o teste.

```rust
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
    Finished test [unoptimized + debuginfo] target(s) in 0.13s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 1 test
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```
Agora vamos alterar nossa entrada para não receber o parametro "_", pois há uma forma melhor de fazer isso.

```rust
use std::io;

fn main() {
    loop {
        println!("Bem vindo ao jogo da adivinhação escolha uma das opções abaixo");
        println!("i - Iniciar o jogo");
        println!("q - Fechar o jogo");

        let mut escolha_str = String::new();
        {==
        io::stdin().read_line(&mut escolha_str).expect("Erro ao receber sua escolha");
        ==}

        match escolha_str.trim().to_lowercase().as_str() {
            "i" => {
                game();
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

fn game() -> () {
    println!("Por favor digite o número que você acredita ser");
    let mut pontuacao: u16 = 1000;
    let numero_alvo: u8 = 42;
    let mut chute = String::new();
    {==
    io::stdin().read_line(&mut chute).expect("Erro ao receber o número");
    ==}

    let chute: u8 = match chute.trim().parse() {
        Ok(num) => num,
        Err(_) => { 
            println!("Valor não é válido ou não está entre 0 e 255");
            0
        }
    };
    check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero_alvo);
}

fn check_win_coditition(pontuacao: &mut u16, numero: &u8, chute: &u8) -> () {
    if chute < numero {
        *pontuacao -= 100;
    }
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero)
}



#[test]
fn test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 1;

    // Act
    check_win_coditition(&mut pontuacao, &numero, &chute);

    // Assert
    assert_eq!(pontuacao, 900)
}
```

Aqui retiramos o parametro não usado e colocamo no final um expect isso é uma captura de erro, vamos detalhar isso mais a frente mas, se pense que agora caso a option que esteja
com algum dado é a `Err` ele vai printar no nosso console as mensagens que colocamos.


## Adicionando condição de vitória

Primeiro passo que vamos fazer é criar um teste para a condição de vitória:

```rust
#[test]
fn test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 1;

    // Act
    check_win_coditition(&mut pontuacao, &numero, &chute);

    // Assert
    assert_eq!(pontuacao, 900)
}

{==
#[test]
fn test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 42;
    
    //Act
    check_win_coditition(&mut pontuacao, &numero, &chute);

    //Asert
    assert_eq!(pontuacao, 1000)
}
==}
```
Aqui criamos uma função de teste _test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao_ onde simplesmente passamos o número correto e ele deve voltar a com a
pontuação exata que passamos.
Vamos rodar o teste:
```bash
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
    Finished test [unoptimized + debuginfo] target(s) in 0.13s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 2 tests
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Certo o teste está passando vamos fazer com que nossa função retorne que o jogador ganhou, normalmente em muitas linguagens trabalhariamos com um valor de verdadeiro ou falso
poderiamos fazer isso aqui também, porém como o rust nos da a ferramenta do result vamos voltar um tipo Result::Win para dizer que o jogador ganhou, mas como vamos ter outras
condições vamos criar uma estrutura de enumerador para representar os estados que jogo pode retornar:

```
#[derive(Debug, PartialEq)]
enum GameResult {
    Win,
    Gaming,
    Lose,
}
```

Vamos primeiro entender o que é um enum:

>! Enum
Enum é um tipo de dado que representa um conjunto de valores que você quer relacionar no nosso caso estamos criando um conjunto relacionado com os estados que podemos representar
sobre a nossa condição de vitória "WIN" para dizer que o jogador venceu, "GAMING" para dizer que o jogador continua jogando, "LOSE" para dizer que o jogador perdeu, nosso caso essa
representação é um enum por isso precisamos passar o tipo de dado e o nome desse enum que no nosso caso é GameResult.
Alguns pontos importantes sobre enums:
* *Valores Variantes*: Em uma enumeração, você define os valores possíveis, chamados de "variantes". Cada variante representa um valor específico que o tipo de enumeração pode ter.
* *Tipos Personalizados*: Enums permitem que você crie tipos personalizados com valores limitados. Por exemplo, você pode criar uma enumeração para representar os dias da semana ou os estados de um jogo.
* *Padrão de Correspondência*: Enums são frequentemente usadas em combinação com o padrão de correspondência (match) para fazer escolhas com base no valor da enumeração. Isso torna as enums úteis para expressar a lógica condicional.
* *Segurança de Tipos*: Enums ajudam a garantir a segurança de tipos, pois o compilador verifica se todas as variantes são tratadas nos padrões de correspondência. Isso evita erros em tempo de execução.
* *Enumerações com Dados*: Enums podem ter dados associados a suas variantes. Isso permite que você armazene informações adicionais com uma variante. Por exemplo, uma enumeração de formas geométricas pode ter uma variante "Círculo" com um raio associado.
* *Enums Genéricas*: Enums podem ser genéricas, o que significa que você pode parametrizá-las com tipos de dados, tornando-as versáteis e reutilizáveis.

Enuns podem ter uma chave e um valor como no exemplo abaixo:
```rust
enum DiaDaSemana {
    Segunda(u32),
    Terca(u32),
    Quarta(u32),
    Quinta(u32),
    Sexta(u32),
    Sabado(u32),
    Domingo(u32),
}
```

Ou com multiplos valores para representar uma chave como abaixo:
```rust
enum Cor {
    RGB(u8, u8, u8),
    Nome(String),
}
```

Há outras formas mas, vamos nos fixar em usa-lo apenas para que a chave e o valor sejam os mesmos que no caso é forma que criamos nosso enum sem passar nenhum tipo.

Agora usamos uma anotação nova que é o  `#[derive(...)]
A anotação #[derive(...)] em Rust é uma característica poderosa que gera automaticamente a implementação de certos traços (traits) para tipos de dados personalizados, como structs e enums. Isso ajuda a evitar a escrita repetitiva de código ao criar tipos de dados personalizados.

#### Trait
Em Rust, um trait é como um contrato ou um conjunto de regras que um tipo de dado deve seguir. É uma maneira de definir comportamentos que tipos diferentes podem compartilhar.

Um trait especifica métodos que um tipo deve implementar, e outros tipos podem aderir a esse trait, implementando esses métodos. Isso permite que diferentes tipos de dados compartilhem funcionalidades comuns.

Por exemplo, você pode ter um trait chamado "Imprimível" que especifica um método imprimir, e várias estruturas diferentes podem implementar esse trait para que possam ser impressas de maneira semelhante, mesmo que sejam tipos diferentes. Isso torna o código mais genérico e reutilizável.

#### No nosso caso vamos passar duas traits
Debug Trait (#[derive(Debug)]): Ao usar #[derive(Debug)] em uma estrutura ou enumeração, Rust gera automaticamente a implementação do trait Debug para esse tipo. O trait Debug permite que você formate o valor do tipo de forma legível por humanos quando você imprime um objeto desse tipo usando a função println!("{:?}", objeto). Isso é particularmente útil para fins de depuração, pois fornece informações detalhadas sobre o estado do objeto.

PartialEq Trait (#[derive(PartialEq)]): Usando #[derive(PartialEq)], Rust gera a implementação do trait PartialEq para o tipo. O trait PartialEq permite que você compare objetos do tipo com operadores de igualdade (==) e desigualdade (!=). Isso significa que você pode verificar se dois objetos são iguais ou diferentes com facilidade, simplificando a lógica de comparação.

Certo agora vamos ajustar o teste para nossa função:

```rust
#[test]
fn test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 42;
    
    //Act
    ==let result = check_win_coditition(&mut pontuacao, &numero, &chute);==

    //Assert
    ==assert_eq!(result, Ok(GameResult::Win));==
    assert_eq!(pontuacao, 1000)
}
```

ali colocamos uma variavel para receber o retorno da nossa função chamado result e também verificamos se essa variavél result retorna no seu ResultSet o valor do enum GameResult
como Win que é o valor do enum que criamos.
Agora vamos rodar o teste.

```bash
cargo test
```
Com o seguinte resultado

```bash
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
error[E0308]: mismatched types
  --> src/main.rs:89:24
   |
89 |     assert_eq!(result, Ok(GameResult::Win));
   |                        ^^^^^^^^^^^^^^^^^^^ expected `()`, found `Result<GameResult, _>`
   |
   = note: expected unit type `()`
                   found enum `Result<GameResult, _>`

For more information about this error, try `rustc --explain E0308`.
error: could not compile `guessing_game` (bin "guessing_game" test) due to previous error
```

Isso ocorreu por que estamos voltando um ResultSet vazio e ele esperava um ResultSet com um GameResult, então vamos mudar o retorno da nossa função.
```rust
...
fn check_win_coditition(pontuacao: &mut u16, numero: &u8, chute: &u8) -> Result<GameResult, GameResult> {
...
```
Aqui falamos que o result tem o OK como  um `GameResult` e o Erro também como um `GameResult` vamos rodar o teste.

```bash
❯ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
error[E0308]: mismatched types
  --> src/main.rs:59:5
   |
59 |     println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero)
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `Result<GameResult, ...>`, found `()`
   |
   = note:   expected enum `Result<GameResult, GameResult>`
           found unit type `()`
   = note: this error originates in the macro `println` (in Nightly builds, run with -Z macro-backtrace for more info)

For more information about this error, try `rustc --explain E0308`.
error: could not compile `guessing_game` (bin "guessing_game" test) due to previous error

```
Aqui fala que o problema é que temos um print no final da função vamos colocar no final um `GameResult::Gaming` para mostrar a condição que o jogo ainda não terminou.

```rust
fn check_win_coditition(pontuacao: &mut u16, numero: &u8, chute: &u8) -> Result<GameResult, GameResult> {
    if chute < numero {
        *pontuacao -= 100;
    }
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero);
    ==Ok(GameResult::Gaming)==
}
```

Aqui colocamos de maneira explicita no final ele vai retornar um result do tipo `OK` com o valor _Gaming_ do nosso enum.
Vale atentar que precisamos agora colocar um  ";" no nosso print.
Agora vamos rodar os testes:

```bash
❯ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
warning: variant `Lose` is never constructed
 --> src/main.rs:7:5
  |
4 | enum GameResult {
  |      ---------- variant in this enum
...
7 |     Lose,
  |     ^^^^
  |
  = note: `GameResult` has a derived impl for the trait `Debug`, but this is intentionally ignored during dead code analysis
  = note: `#[warn(dead_code)]` on by default

warning: unused `Result` that must be used
  --> src/main.rs:51:5
   |
51 |     check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this `Result` may be an `Err` variant, which should be handled
   = note: `#[warn(unused_must_use)]` on by default
help: use `let _ = ...` to ignore the resulting value
   |
51 |     let _ = check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     +++++++

warning: unused `Result` that must be used
  --> src/main.rs:73:5
   |
73 |     check_win_coditition(&mut pontuacao, &numero, &chute);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this `Result` may be an `Err` variant, which should be handled
help: use `let _ = ...` to ignore the resulting value
   |
73 |     let _ = check_win_coditition(&mut pontuacao, &numero, &chute);
   |     +++++++

warning: `guessing_game` (bin "guessing_game" test) generated 3 warnings
    Finished test [unoptimized + debuginfo] target(s) in 0.15s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 2 tests
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... FAILED

failures:

---- test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao stdout ----
A sua pontuação foi 1000, e o número era 42
{==
thread 'test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao' panicked at src/main.rs:90:5:
assertion `left == right` failed
  left: Ok(Gaming)
 right: Ok(Win)
==}
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace



failures:
    test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao

test result: FAILED. 1 passed; 1 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

error: test failed, to rerun pass `--bin guessing_game`
```

Aqui vamos ter alguns warnings, mas no ponto de destaque mostra ainha que deu erro, no meu caso ainha 90 e mostra que ele espearava um `Ok(Win)` mas, recebeu um `Ok(Gaming)`.
Então finalmente  podemos agora colocar nosso bloco de código que determina que o usuário venceu que nesse caso será um _if_.


```rust
fn check_win_coditition(pontuacao: &mut u16, numero: &u8, chute: &u8) -> Result<GameResult, GameResult> {
    {==
    if chute == numero {
        return Ok(GameResult::Win)
    }
    ==}
    if chute < numero {
        *pontuacao -= 100;
    }
    println!("A sua pontuação foi {}, e o número era {}", pontuacao, numero);
    Ok(GameResult::Gaming)
}
```

Aqui comparamos que o chute é igual ao número e caso essa comparação seja verdadeira precisamos colocar a palavra chave return com o  `Ok(GameResult::Win)` pois temos mais código
que vai ser executado abaixo dele então estamos forçando um retorno prematuro.

Agora vamos rodar os testes.

```bash
❯ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
warning: variant `Lose` is never constructed
 --> src/main.rs:7:5
  |
4 | enum GameResult {
  |      ---------- variant in this enum
...
7 |     Lose,
  |     ^^^^
  |
  = note: `GameResult` has a derived impl for the trait `Debug`, but this is intentionally ignored during dead code analysis
  = note: `#[warn(dead_code)]` on by default

warning: unused `Result` that must be used
  --> src/main.rs:51:5
   |
51 |     check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this `Result` may be an `Err` variant, which should be handled
   = note: `#[warn(unused_must_use)]` on by default
help: use `let _ = ...` to ignore the resulting value
   |
51 |     let _ = check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     +++++++

warning: unused `Result` that must be used
  --> src/main.rs:76:5
   |
76 |     check_win_coditition(&mut pontuacao, &numero, &chute);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this `Result` may be an `Err` variant, which should be handled
help: use `let _ = ...` to ignore the resulting value
   |
76 |     let _ = check_win_coditition(&mut pontuacao, &numero, &chute);
   |     +++++++

warning: `guessing_game` (bin "guessing_game" test) generated 3 warnings
    Finished test [unoptimized + debuginfo] target(s) in 0.14s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 2 tests
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Ainda temos alguns warnings mas, nossos testes voltaram a passar.


## Adicionando condição de derrota

Bom agora vamos criar uma condição pra nossa função registrar a derrota. Mas, primeiro vamos criar o teste.

```rust
#[test]
fn test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 1;

    // Act
    ==let _ = check_win_coditition(&mut pontuacao, &numero, &chute);==

    // Assert
    assert_eq!(pontuacao, 900)
}

#[test]
fn test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 42;

    //Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    //Asert
    assert_eq!(result, Ok(GameResult::Win));
    assert_eq!(pontuacao, 1000)
}

{==
#[test]
fn test_jogador_deu_numero_errado_deve_finalizar_jogo_perdendo() {
    // Arrange
    let mut pontuacao: u16 = 100;
    let numero: u8 = 42;
    let chute: u8 = 1;

    //Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    //Asert
    assert_eq!(result, Ok(GameResult::Lose));
    assert_eq!(pontuacao, 0)
}
==}
```
Nesse teste diminuimos a pontuação e erramos pra baixo e ele deve voltar o rusult como Lose e a pontuação como 0. Então vamos testar.
```bash
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
warning: unused `Result` that must be used
  --> src/main.rs:54:5
   |
54 |     check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this `Result` may be an `Err` variant, which should be handled
   = note: `#[warn(unused_must_use)]` on by default
help: use `let _ = ...` to ignore the resulting value
   |
54 |     let _ = check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     +++++++

warning: `guessing_game` (bin "guessing_game" test) generated 1 warning
    Finished test [unoptimized + debuginfo] target(s) in 0.17s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 3 tests
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... ok
test test_jogador_deu_numero_errado_deve_finalizar_jogo_perdendo ... FAILED

failures:

---- test_jogador_deu_numero_errado_deve_finalizar_jogo_perdendo stdout ----
{==
A sua pontuação foi 0, e o número era 42
thread 'test_jogador_deu_numero_errado_deve_finalizar_jogo_perdendo' panicked at src/main.rs:119:5:
assertion `left == right` failed
  left: Ok(Gaming)
 right: Ok(Lose)
==}
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace


failures:
    test_jogador_deu_numero_errado_deve_finalizar_jogo_perdendo

test result: FAILED. 2 passed; 1 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

error: test failed, to rerun pass `--bin guessing_game`
```

Bom tivemos um erro por que voltou _Gaming_ ao invés de _Lose_, para arrumarmos isso vamos ajustar nossa função.

```rust
fn check_win_coditition(
    pontuacao: &mut u16,
    numero: &u8,
    chute: &u8,
) -> Result<GameResult, GameResult> {
    if chute == numero {
        return Ok(GameResult::Win);
    }
    if chute < numero {
        *pontuacao -= 100;
    }
    {==
    if *pontuacao <= 0 {
        return Ok(GameResult::Lose);
    }
    ==}
    println!(
        "A sua pontuação foi {}, e o número era {}",
        pontuacao, numero
    );
    Ok(GameResult::Gaming)
}

```
Aqui adicionamos mais uma condição para que se a pontuação for menor ou igual a 0 retornamos `GameResult::Lose` pra função chamadora, agora vamos testar novamente.

```rust
❮ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
warning: unused `Result` that must be used
  --> src/main.rs:54:5
   |
54 |     check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this `Result` may be an `Err` variant, which should be handled
   = note: `#[warn(unused_must_use)]` on by default
help: use `let _ = ...` to ignore the resulting value
   |
54 |     let _ = check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     +++++++

warning: `guessing_game` (bin "guessing_game" test) generated 1 warning
    Finished test [unoptimized + debuginfo] target(s) in 0.13s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 3 tests
test test_jogador_deu_numero_errado_deve_finalizar_jogo_perdendo ... ok
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... ok

test result: ok. 3 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Perfeito agora nosso teste passou mas, vamos criar outro teste passando nosso chute sendo um valor maior que o número alvo.

```rust
#[test]
==fn test_jogador_deu_numero_errado_baixo_deve_finalizar_jogo_perdendo() { ==
    // Arrange
    let mut pontuacao: u16 = 100;
    let numero: u8 = 42;
    let chute: u8 = 1;

    //Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    //Asert
    assert_eq!(result, Ok(GameResult::Lose));
    assert_eq!(pontuacao, 0)
}
{==
#[test]
fn test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo() {
    // Arrange
    let mut pontuacao: u16 = 100;
    let numero: u8 = 42;
    let chute: u8 = 100;

    //Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    //Asert
    assert_eq!(result, Ok(GameResult::Lose));
    assert_eq!(pontuacao, 0)
}
==}
```
Aqui renomeamos o nosso teste anterior pra explicitar que estamos chutando um número baixo e criamos outro explicitando que estamos chutando um número altoi, agora rodando os testes teremos uma falha.

```bash
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
warning: unused `Result` that must be used
  --> src/main.rs:54:5
   |
54 |     check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this `Result` may be an `Err` variant, which should be handled
   = note: `#[warn(unused_must_use)]` on by default
help: use `let _ = ...` to ignore the resulting value
   |
54 |     let _ = check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     +++++++

warning: `guessing_game` (bin "guessing_game" test) generated 1 warning
    Finished test [unoptimized + debuginfo] target(s) in 0.14s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 4 tests
test test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo ... FAILED
test test_jogador_deu_numero_errado_baixo_deve_finalizar_jogo_perdendo ... ok
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... ok
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok

failures:

---- test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo stdout ----
{==
A sua pontuação foi 100, e o número era 42
thread 'test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo' panicked at src/main.rs:137:5:
assertion `left == right` failed
  left: Ok(Gaming)
 right: Ok(Lose)
==}
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace


failures:
    test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo

test result: FAILED. 3 passed; 1 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

error: test failed, to rerun pass `--bin guessing_game`

```

Como podemos ver ele voltou _Gaming_ ao invés de _Lose_ isso por que não implementamos a condição pra que o valor maior decremente então vamos cria-la.

```rust
 check_win_coditition(
    pontuacao: &mut u16,
    numero: &u8,
    chute: &u8,
) -> Result<GameResult, GameResult> {
    {==
    if chute < numero {
        *pontuacao -= 100;
    }
    if chute > numero {
        *pontuacao -= 100;
    }
    ==}
    if chute == numero {
        return Ok(GameResult::Win);
    }
    if *pontuacao <= 0 {
        return Ok(GameResult::Lose);
    }
    println!(
        "A sua pontuação foi {}, e o número era {}",
        pontuacao, numero
    );
    Ok(GameResult::Gaming)
}
```
Aqui colocamos nossa condição de decrementar a pontuação com um erro como a primeira coisa a ser verificada, para evitar qualquer problema de ser decrementado após verificar a condição de vitória, assim adicionamos mais um _if_ no nosso código e podemos rodar o teste para verificar se está passando.

```bash
❯ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
warning: unused `Result` that must be used
  --> src/main.rs:54:5
   |
54 |     check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this `Result` may be an `Err` variant, which should be handled
   = note: `#[warn(unused_must_use)]` on by default
help: use `let _ = ...` to ignore the resulting value
   |
54 |     let _ = check_win_coditition(&mut pontuacao, &numero_alvo, &chute);
   |     +++++++

warning: `guessing_game` (bin "guessing_game" test) generated 1 warning
    Finished test [unoptimized + debuginfo] target(s) in 0.13s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 4 tests
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... ok
test test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_errado_baixo_deve_finalizar_jogo_perdendo ... ok
test test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo ... ok

test result: ok. 4 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Bom agora conseguimos ter a condição de derrota no nosso jogo.

## Criando mais testes

Bom agora que temos nossa condição para decrementar a pontuação quando erramos pra cima ou pra baixo, precisamos ajustar nosso teste _test_jogador_deu_numero_errado_deve_diminuir_pontuacao_geral_ para receber a condição `GameResult::Gaming` e também criar um novo teste para explicitar o chute pra cima e o outro pra baixo.

```rust
 -> () {
    println!("Por favor digite o número que você acredita ser");
    let mut pontuacao: u16 = 1000;
    let numero_alvo: u8 = 42;
    let mut chute = String::new();
    io::stdin()
        .read_line(&mut chute)
        .expect("Erro ao receber o número");

    let chute: u8 = match chute.trim().parse() {
        Ok(num) => num,
        Err(_) => {
            println!("Valor não é válido ou não está entre 0 e 255");
            0
        }
    };
    ==let _result = check_win_coditition(&mut pontuacao, &numero_alvo, &chute); ==
    println!(
        "A sua pontuação foi {}, e o número era {}",
        pontuacao, numero_alvo
    );
}

...
#[test]
{==fn test_jogador_deu_numero_errado_pra_baixo_deve_diminuir_pontuacao_geral() { ==}
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 1;

    // Act
    ==let result = check_win_coditition(&mut pontuacao, &numero, &chute);==

    // Assert
    assert_eq!(result, Ok(GameResult::Gaming));
    assert_eq!(pontuacao, 900)
}

{==
#[test]
fn test_jogador_deu_numero_errado_pra_cima_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 100;

    // Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    // Assert
    assert_eq!(result, Ok(GameResult::Gaming));
    assert_eq!(pontuacao, 900)
}
==}
```

Aqui mudamos o nome do teste anterior e criamos um novo além de adiconar o result para verificação e também pra nossa função game, o agora se rodarmos os testes os warnings vão desaparecer.

```bash
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
    Finished test [unoptimized + debuginfo] target(s) in 0.12s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 5 tests
test test_jogador_deu_numero_errado_baixo_deve_finalizar_jogo_perdendo ... ok
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... ok
test test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo ... ok
test test_jogador_deu_numero_errado_pra_baixo_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_errado_pra_cima_deve_diminuir_pontuacao_geral ... ok

test result: ok. 5 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

```

## Melhorando nossa função de condição e ajustando a função game.

Bom poderiamos agora criar testes de integração pra nossa função game, mas vamos trabalhar isso mais a frente, agora vamos melhorar nossa função game, não importa se acertamos ou ▍erramos nós voltamos ao menu principal, então precisamos só voltar pro loop do menu quando perdemos ou ganharmos o jogo pra isso vamos criar um novo loop no nosso jogo.

```rust
{==
fn game() -> () {
    let mut pontuacao: u16 = 1000;
    let numero_alvo: u8 = 42;
    loop {
        println!("Por favor digite o número que você acredita ser");
        let mut chute = String::new();
        io::stdin()
            .read_line(&mut chute)
            .expect("Erro ao receber o número");

        let chute: u8 = match chute.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Valor não é válido ou não está entre 0 e 255");
                0
            }
        };
        match check_win_coditition(&mut pontuacao, &numero_alvo, &chute) {
            Ok(result) => {
                if result == GameResult::Win {
                    println!("Parabéns você venceu! Sua pontuação foi {}", pontuacao);
                    break;
                } else if result == GameResult::Lose {
                    println!("Que pena você perdeu!");
                    break;
                }
            }
            Err(_) => {
                println!("Ocorreu um erro e o jogo será reiniciado!");
                break;
            }
        };
        println!("A sua pontuação está em {}", pontuacao);
    }
}
==}

fn check_win_coditition(
    pontuacao: &mut u16,
    numero: &u8,
    chute: &u8,
) -> Result<GameResult, GameResult> {
    if chute < numero {
        == println!("O número é maior!"); ==
        *pontuacao -= 100;
    }
    if chute > numero {
        == println!("O número é menor!"); ==
        *pontuacao -= 100;
    }
    if chute == numero {
        return Ok(GameResult::Win);
    }
    if *pontuacao <= 0 {
        return Ok(GameResult::Lose);
    }
    {== ==}
    Ok(GameResult::Gaming)
}
```

Aqui criamos um loop dentro da nossa função game e só deixamos o número alvo e a pontuação fora pois sempre que iniciar um jogo vamos reiniciar o placar. Nossa função _check_win_condition_ nos retorna um `ResultGame`, por conta disso podemos fazer um match para caso entre na condição de vitória ou derrota o jogo é encerrado e volta no menu, também caso tenhamos algum erro de execução ele vai retornar o jogo pro menu.
Também colocamos uma dica pro jogador saber se o número é maior ou menor para facilitar que ele.

Para ter certeza que não quebramos nada vamos rodar nossos testes.

```bash
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
    Finished test [unoptimized + debuginfo] target(s) in 0.16s
     Running unittests src/main.rs (target/debug/deps/guessing_game-d4e6bf5f3d77f592)

running 5 tests
test test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo ... ok
test test_jogador_deu_numero_errado_baixo_deve_finalizar_jogo_perdendo ... ok
test test_jogador_deu_numero_errado_pra_baixo_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_errado_pra_cima_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... ok

test result: ok. 5 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

```

Com isso agora já temos um jogo bem jogável.

## Colocando aleatoriedade no nosso jogo

Nosso jogo está bem interessante mas, nesse momento nosso número alvo está fixo e queremos que ele seja aleatório para isso vamos precisar de uma biblioteca que não está no padrão da linguagem rust que é o rand.

### Introdução aos crates

Rust é uma linguagem de programação que ganhou popularidade devido à sua segurança, desempenho e concorrência. Um dos conceitos fundamentais no ecossistema Rust é o de "crates". Vamos explorar o que são os crates em Rust e como eles funcionam para facilitar o desenvolvimento de software.

#### O Que São Crates?

Em Rust, um "crate" é a unidade de compilação de código. Um crate pode ser uma biblioteca, um aplicativo, um binário ou até mesmo um subconjunto menor de código. A ideia por trás dos crates é promover a modularidade e a reutilização de código, permitindo que você organize seu projeto de forma limpa e eficaz.

#### Tipos de Crates

Existem dois tipos principais de crates em Rust: crates binários e crates de biblioteca.

* *Crates Binários:* Esses são os crates que criam um executável quando compilados. Eles são destinados a iniciar um programa e geralmente contêm a função main(). Um exemplo de crate binário é um aplicativo de linha de comando ou uma aplicação de servidor.

* *Crates de Biblioteca:* Esses crates não têm uma função main() e são destinados a serem usados como bibliotecas por outros crates. Os crates de biblioteca podem conter funções, estruturas, enums e muito mais que podem ser usados por outros desenvolvedores para criar seus programas.

#### Estrutura de Diretórios de um Crate

Dentro do diretório do seu crate, você encontrará uma estrutura típica de diretórios:

* src: Contém o código-fonte do seu crate.
* Cargo.toml: Arquivo de configuração do seu crate, onde você especifica dependências e outras informações.
* tests: Diretório para escrever testes para o seu crate.
* examples: Diretório para incluir exemplos de código para demonstrar o uso do seu crate.

#### Gerenciando Dependências

Rust usa o gerenciador de pacotes Cargo para gerenciar dependências. Você pode especificar as dependências necessárias no arquivo Cargo.toml. Quando você compila seu crate, o Cargo se encarrega de baixar e compilar todas as dependências automaticamente.

#### Usando Crates de Terceiros

Um dos principais benefícios do ecossistema Rust é a facilidade de uso de crates de terceiros. Você pode pesquisar e encontrar uma vasta coleção de crates de alta qualidade no Rust's package registry, crates.io. Para adicionar uma dependência a um crate, basta adicionar a linha apropriada no seu arquivo Cargo.toml.

```toml

[dependencies]
nome_do_pacote = "versao"
```

Após adicionar a dependência, execute cargo build para baixar e compilar os crates necessários.

Também podemos instalar diratamente na linha de comando como abaixo:

```bash
cargo add lib
```


Crates são um componente fundamental do ecossistema Rust, permitindo que você desenvolva, compartilhe e reutilize código de maneira eficaz. A modularidade e a facilidade de gerenciamento de dependências tornam Rust uma linguagem poderosa para o desenvolvimento de software. Compreender o sistema de crates é essencial para qualquer desenvolvedor Rust, pois é uma parte integrante do processo de construção de aplicações robustas e seguras.

Agora vamos entrar no site do [crates.io](https://crates.io) vamos buscar a biblioteca rand, aqui no crates.io podemos ver mais sobre a biblioteca, no nosso caso essa biblioteca serve para gerar números aleatório.
Vamos instala-la.

```bash
cargo add rand
```

Agora vamos implementa-la no nosso código.

```rust
==use rand::{thread_rng, Rng};==
use std::io;

#[derive(Debug, PartialEq)]
enum GameResult {
    Win,
    Gaming,
    Lose,
}

fn main() {
    loop {
        println!("Bem vindo ao jogo da adivinhação escolha uma das opções abaixo");
        println!("i - Iniciar o jogo");
        println!("q - Fechar o jogo");

        let mut escolha_str = String::new();
        io::stdin()
            .read_line(&mut escolha_str)
            .expect("Erro ao receber sua escolha");

        match escolha_str.trim().to_lowercase().as_str() {
            "i" => {
                game();
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

fn game() -> () {
    let mut pontuacao: u16 = 1000;
    ==let numero_alvo: u8 = thread_rng().gen_range(1..100);==
    loop {
        println!("Por favor digite o número que você acredita ser");
        let mut chute = String::new();
        io::stdin()
            .read_line(&mut chute)
            .expect("Erro ao receber o número");

        let chute: u8 = match chute.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Valor não é válido ou não está entre 0 e 255");
                0
            }
        };
        match check_win_coditition(&mut pontuacao, &numero_alvo, &chute) {
            Ok(result) => {
                if result == GameResult::Win {
                    println!("Parabéns você venceu! Sua pontuação foi {}", pontuacao);
                    break;
                } else if result == GameResult::Lose {
                    println!("Que pena você perdeu!");
                    break;
                }
            }
            Err(_) => {
                println!("Ocorreu um erro e o jogo será reiniciado!");
                break;
            }
        };
        println!("A sua pontuação está em {}", pontuacao);
    }
}

fn check_win_coditition(
    pontuacao: &mut u16,
    numero: &u8,
    chute: &u8,
) -> Result<GameResult, GameResult> {
    if chute < numero {
        println!("O número é maior!");
        *pontuacao -= 100;
    }
    if chute > numero {
        println!("O número é menor!");
        *pontuacao -= 100;
    }
    if chute == numero {
        return Ok(GameResult::Win);
    }
    if *pontuacao <= 0 {
        return Ok(GameResult::Lose);
    }
    Ok(GameResult::Gaming)
}

#[test]
fn test_jogador_deu_numero_errado_pra_baixo_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 1;

    // Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    // Assert
    assert_eq!(result, Ok(GameResult::Gaming));
    assert_eq!(pontuacao, 900)
}

#[test]
fn test_jogador_deu_numero_errado_pra_cima_deve_diminuir_pontuacao_geral() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 100;

    // Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    // Assert
    assert_eq!(result, Ok(GameResult::Gaming));
    assert_eq!(pontuacao, 900)
}

#[test]
fn test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao() {
    // Arrange
    let mut pontuacao: u16 = 1000;
    let numero: u8 = 42;
    let chute: u8 = 42;

    //Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    //Asert
    assert_eq!(result, Ok(GameResult::Win));
    assert_eq!(pontuacao, 1000)
}

#[test]
fn test_jogador_deu_numero_errado_baixo_deve_finalizar_jogo_perdendo() {
    // Arrange
    let mut pontuacao: u16 = 100;
    let numero: u8 = 42;
    let chute: u8 = 1;

    //Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    //Asert
    assert_eq!(result, Ok(GameResult::Lose));
    assert_eq!(pontuacao, 0)
}

#[test]
fn test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo() {
    // Arrange
    let mut pontuacao: u16 = 100;
    let numero: u8 = 42;
    let chute: u8 = 100;

    //Act
    let result = check_win_coditition(&mut pontuacao, &numero, &chute);

    //Asert
    assert_eq!(result, Ok(GameResult::Lose));
    assert_eq!(pontuacao, 0)
}
```

No caso do rand gerar o número que queremos precisamos usar a função _gen_range_ olhando na documentação precisamos importar `use rand::{thread_rng, Rng};` que são as funções de base e simplemente removemos o número fixo por essa função na declaração da variável.

```rust
    let numero_alvo: u8 = thread_rng().gen_range(1..100);
```

Ai colocamos que queremos gerar um valor entre 1 e 100 e agora vamos rodar os testes para ver se nossa alteração quebrou alguma coisa.
```bash
➜ cargo test
   Compiling guessing_game v0.1.0 (/home/feanor/worspace/protipos-jogos-curso/guessing_game)
    Finished test [unoptimized + debuginfo] target(s) in 0.15s
     Running unittests src/main.rs (target/debug/deps/guessing_game-1e17f810f8775677)

running 5 tests
test test_jogador_deu_numero_errado_pra_cima_deve_diminuir_pontuacao_geral ... ok
test test_jogador_deu_numero_errado_alto_deve_finalizar_jogo_perdendo ... ok
test test_jogador_deu_numero_errado_baixo_deve_finalizar_jogo_perdendo ... ok
test test_jogador_deu_numero_exato_deve_finalizar_jogo_sem_mudar_pontuacao ... ok
test test_jogador_deu_numero_errado_pra_baixo_deve_diminuir_pontuacao_geral ... ok

test result: ok. 5 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

Certo tudo funcionando.

## Segurança de Memória

Rust fornece uma série de garantias de segurança de memória durante o tempo de compilação. Essas garantias são fundamentais para evitar erros comuns, como vazamentos de memória, referências nulas e acessos inválidos.

* Sem Referências Nulas: Rust garante que as referências não sejam nulas, eliminando muitos erros de acesso nulo.
* Sem Vazamentos de Memória: Rust controla rigorosamente o ciclo de vida dos recursos, o que impede vazamentos de memória.
* Sem Concorrência de Dados Mutáveis: Rust impõe regras rigorosas para evitar a concorrência de dados mutáveis, garantindo a segurança em threads.

## Conclusão
Com esse jogo vimos como criar uma função em rust, criar testes para essa função usando a suite nativa de testes do rust, mais algumas funções de manipulação de strings, como
funciona o conceito de borrow and ownership, como funciona o gerenciamento de memória do rust.

## Exercicíos sugeridos

Exercício 1: Jogo de Perguntas e Respostas

Crie um jogo de perguntas e respostas em que o jogador deve responder a várias perguntas. O jogo deve incluir as seguintes funcionalidades:

    O programa deve conter um conjunto de perguntas e respostas.
    O jogador deve receber uma pergunta e fornecer uma resposta.
    O programa deve verificar se a resposta está correta e atualizar a pontuação do jogador.
    Use funções para organizar o código, armazenar perguntas e respostas, e verificar as respostas do jogador.
    Escreva testes para garantir que o jogo funcione corretamente.

Exercício 2: Jogo de Aventura com História Interativa

Crie um jogo de aventura com uma história interativa em que o jogador toma decisões que afetam o desenrolar da história. O jogo deve incluir as seguintes funcionalidades:

    Use enumerações para representar as diferentes escolhas e eventos na história.
    Use variáveis mutáveis para rastrear o progresso da história e as decisões do jogador.
    Use loops para permitir que o jogador faça escolhas ao longo da história.
    Use if, if else e match para verificar as escolhas do jogador e os resultados na história.
    Use a macro println! para exibir a narrativa da aventura.

Exercício 3: Jogo da Forca

Crie um jogo multiplayer alternativo da forca em que o jogador deve adivinhar uma palavra oculta. O jogo deve incluir as seguintes funcionalidades:

    O programa deve receber uma palavra aleatória de um jogador e uma dica.
    O outro jogador deve fazer tentativas para adivinhar a palavra escrevendo ela inteira.
    O programa deve mostrar uma representação de quantas tentativas faltam.
    O jogo deve ser encerrado quando o jogador adivinhar a palavra corretamente ou após um número máximo de tentativas.
    Use funções para organizar o código.
    Escreva testes para garantir que o jogo funcione corretamente.

Exercício 4: Simulador de Compras com Crate Rust Money

Crie um simulador de compras em que o jogador tem um orçamento limitado e deve fazer compras. Use o crate rust-money para representar valores monetários. O jogo deve incluir as seguintes funcionalidades:

    Instale o crate rust-money para lidar com valores monetários.
    Use variáveis mutáveis para rastrear o orçamento do jogador e o custo dos itens.
    Use loops para permitir que o jogador faça várias compras.
    Use if e match para verificar se o jogador pode pagar por um item e atualizar o orçamento.
    Use a macro println! para exibir informações sobre as compras.

