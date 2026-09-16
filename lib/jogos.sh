#!/usr/bin/env bash
# Seleciona jogos de um calendario da NHL.

# Primeiro jogo por disputar, ou "null".
jogo_seguinte() {
  jq -c '[.games[] | select(.gameState == "FUT" or .gameState == "PRE")] | first' <<<"$1"
}

# Ultimo jogo ja disputado, ou "null".
jogo_anterior() {
  jq -c '[.games[] | select(.gameState == "OFF" or .gameState == "FINAL")] | last' <<<"$1"
}
