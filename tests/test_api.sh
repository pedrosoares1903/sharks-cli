#!/usr/bin/env bash
set -uo pipefail

falhas=0

verifica() {
  local descricao="$1"; shift
  if "$@" >/dev/null 2>&1; then
    echo "  ok    $descricao"
  else
    echo "  FALHA $descricao"
    falhas=$((falhas + 1))
  fi
}

echo "A correr os testes do sharks-cli"
echo

verifica "o --version responde"            ./bin/sharks --version
verifica "o --help responde"               ./bin/sharks --help
verifica "um comando invalido devolve erro" ! ./bin/sharks comando-que-nao-existe

echo
if [ "$falhas" -eq 0 ]; then
  echo "Todos os testes passaram."
  exit 0
else
  echo "$falhas teste(s) falharam."
  exit 1
fi
