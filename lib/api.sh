#!/usr/bin/env bash
# Acesso a API publica da NHL.

NHL_API="${NHL_API:-https://api-web.nhle.com/v1}"
EQUIPA="${EQUIPA:-SJS}"
EPOCA="${EPOCA:-now}"

# Faz um pedido GET e devolve o corpo da resposta.
api_get() {
  local caminho="$1"
  curl -sS --fail --max-time 10 "${NHL_API}${caminho}"
}

# Calendario da epoca inteira. Sem argumento, usa a EPOCA configurada.
api_calendario() {
  local epoca="${1:-$EPOCA}"
  api_get "/club-schedule-season/${EQUIPA}/${epoca}"
}

# 20252026 -> 20262027
epoca_seguinte() {
  local epoca="$1"
  echo "$(( ${epoca:0:4} + 1 ))$(( ${epoca:4:4} + 1 ))"
}
