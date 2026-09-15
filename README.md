# sharks-cli

Consulta dados dos **San Jose Sharks** a partir da API publica da NHL, a partir do terminal.

Escrito em Bash, sem dependencias alem do `curl` e do `jq`. Nao precisa de chave de API.

## Requisitos

- `bash`
- `curl`
- `jq`

## Instalacao

git clone https://github.com/<o-teu-utilizador>/sharks-cli.git
cd sharks-cli
./bin/sharks --help


## Utilizacao

sharks --version mostra a versao
sharks --help mostra a ajuda


## Estado

| Comando | Estado |
|---|---|
| `--help` / `--version` | disponivel |
| `next` — proximo jogo | em desenvolvimento |
| `last` — ultimo resultado | previsto |
| `standings` — classificacao | previsto (a API so devolve dados com a epoca a decorrer) |
| `roster` — plantel | previsto |

## Testes

./tests/test_api.sh

## Fonte de dados

API publica da NHL (`api-web.nhle.com`), nao documentada oficialmente.
Referencia da comunidade: https://github.com/Zmalski/NHL-API-Reference

## Licenca

MIT
