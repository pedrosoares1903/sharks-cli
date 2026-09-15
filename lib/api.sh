#!/usr/bin/env bash
# Acesso a API publica da NHL.

NHL_API="${NHL_API:-https://api-web.nhle.com/v1}"
EQUIPA="${EQUIPA:-SJS}"
EPOCA="${EPOCA:-now}"

# Faz um pedido GET e devolve o corpo da resposta.
# --fail faz o curl devolver codigo de erro num 404, em vez de imprimir a pagina de erro.
api_get() {
  local caminho="$1"
  curl -sS --fail --max-time 10 "${NHL_API}${caminho}"
}

# Calendario da epoca inteira da equipa.
api_calendario() {
  api_get "/club-schedule-season/${EQUIPA}/${EPOCA}"
}
