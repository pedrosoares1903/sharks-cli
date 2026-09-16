#!/usr/bin/env bash
# Transforma o JSON da NHL em texto legivel.

ID_SHARKS=28

# "fora" ou "em casa", do ponto de vista dos Sharks.
_onde() {
  local id_fora
  id_fora=$(jq -r '.awayTeam.id' <<<"$1")
  if [ "$id_fora" = "$ID_SHARKS" ]; then echo "fora"; else echo "em casa"; fi
}

# " (pre-epoca)", " (playoffs)" ou vazio.
_etiqueta_tipo() {
  case "$(jq -r '.gameType' <<<"$1")" in
    1) echo " (pre-epoca)" ;;
    3) echo " (playoffs)"  ;;
    *) echo ""             ;;
  esac
}

formata_jogo_futuro() {
  local jogo="$1" inicio recinto casa fora quando
  inicio=$(jq  -r '.startTimeUTC'                            <<<"$jogo")
  recinto=$(jq -r '.venue.default // "recinto desconhecido"' <<<"$jogo")
  casa=$(jq    -r '.homeTeam.commonName.default // "?"'      <<<"$jogo")
  fora=$(jq    -r '.awayTeam.commonName.default // "?"'      <<<"$jogo")
  quando=$(date -d "$inicio" "+%a, %d %b %Y as %H:%M" 2>/dev/null || echo "$inicio")

  echo "Proximo jogo: ${fora} @ ${casa}$(_etiqueta_tipo "$jogo")"
  echo "${quando} (hora local) — ${recinto}, $(_onde "$jogo")"
}

formata_jogo_terminado() {
  local jogo="$1" data casa fora golos_casa golos_fora golos_sjs golos_adv resultado
  data=$(jq       -r '.gameDate'                           <<<"$jogo")
  casa=$(jq       -r '.homeTeam.commonName.default // "?"' <<<"$jogo")
  fora=$(jq       -r '.awayTeam.commonName.default // "?"' <<<"$jogo")
  golos_casa=$(jq -r '.homeTeam.score // 0'                <<<"$jogo")
  golos_fora=$(jq -r '.awayTeam.score // 0'                <<<"$jogo")

  if [ "$(_onde "$jogo")" = "fora" ]; then
    golos_sjs=$golos_fora; golos_adv=$golos_casa
  else
    golos_sjs=$golos_casa; golos_adv=$golos_fora
  fi

  if [ "$golos_sjs" -gt "$golos_adv" ]; then resultado="vitoria"; else resultado="derrota"; fi

  echo "Ultimo jogo: ${fora} ${golos_fora} - ${golos_casa} ${casa}  (${resultado})"
  echo "${data}$(_etiqueta_tipo "$jogo") — $(_onde "$jogo")"
}
