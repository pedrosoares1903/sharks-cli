# Registo de alteracoes

Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/).
Este projeto segue [versionamento semantico](https://semver.org/lang/pt-BR/).

## [Nao lancado]

### Previsto
- `sharks standings` — classificacao, a partir do inicio da epoca 2026-2027.

## [0.2.0] — 2026-09-16

### Adicionado
- Comando `sharks last`: ultimo jogo disputado, com resultado e vitoria/derrota.
- Testes de formatacao com respostas reais guardadas em `tests/fixtures/`.

### Alterado
- A selecao de jogos passou para `lib/jogos.sh`, separada do acesso a rede
  e da formatacao.

### Limitacoes conhecidas
- Derrotas no prolongamento ou nos penaltis aparecem como derrota simples (#3).

## [0.1.0] — 2026-09-15

### Adicionado
- Comando `sharks next`: proximo jogo, com data, recinto e se e em casa ou fora.
- Estrutura inicial do projeto e testes em shell.

### Corrigido
- A escolha da epoca passou a avancar quando `now` aponta para uma epoca
  sem jogos por disputar.
