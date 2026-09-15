#!/usr/bin/env bash
# Transforma o JSON da NHL em texto legivel.

ID_SHARKS=28

# Recebe um objeto JSON de um jogo e imprime-o.
formata_jogo() {
  local jogo="$1"
  local inicio recinto casa fora id_fora tipo onde etiqueta quando

  inicio=$(jq  -r '.startTimeUTC'                            <<<"$jogo")
  recinto=$(jq -r '.venue.default // "recinto desconhecido"' <<<"$jogo")
  casa=$(jq    -r '.homeTeam.commonName.default // "?"'      <<<"$jogo")
  fora=$(jq    -r '.awayTeam.commonName.default // "?"'      <<<"$jogo")
  id_fora=$(jq -r '.awayTeam.id'                             <<<"$jogo")
  tipo=$(jq    -r '.gameType'                                <<<"$jogo")

  onde="em casa"
  [ "$id_fora" = "$ID_SHARKS" ] && onde="fora"

  etiqueta=""
  case "$tipo" in
    1) etiqueta=" (pre-epoca)" ;;
    3) etiqueta=" (playoffs)"  ;;
  esac

  quando=$(date -d "$inicio" "+%a, %d %b %Y as %H:%M" 2>/dev/null || echo "$inicio")

  echo "Proximo jogo: ${fora} @ ${casa}${etiqueta}"
  echo "${quando} (hora local) — ${recinto}, ${onde}"
}
