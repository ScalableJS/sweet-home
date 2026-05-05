#!/bin/bash
# Multilingual Search Skill — Gemini parallel orchestrator
#
# Usage:
#   ./search_skill_gemini.sh "запрос"
#   ./search_skill_gemini.sh "запрос" gemini-2.5-pro
#   ./search_skill_gemini.sh "запрос" gemini-3.1-pro-preview

set -euo pipefail

QUERY="${1:?Usage: $0 \"search query\" [model]}"
MODEL="${2:-gemini-2.5-pro}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LANE_PROMPT="$(cat "$SCRIPT_DIR/search_skill_lane_prompt.txt")"
TMPDIR_LANES="$(mktemp -d)"
trap "rm -rf $TMPDIR_LANES" EXIT

echo "=== Multilingual Search Skill (Gemini parallel) ==="
echo "Query  : $QUERY"
echo "Model  : $MODEL"
echo "==================================================="

# ---------- адаптация запросов ----------
PL_QUERY="ekipa remontowa wykończenie pod klucz Kraków opinie cennik 2025 2026"
RU_QUERY="бригада ремонт квартир Краков Польша цена отзывы 2025"
UK_QUERY="бригада ремонт квартири Краків Польща ціна відгуки 2025"
EN_QUERY="apartment renovation contractors Krakow Poland review price 2025"

# Если в запросе есть специфичные слова — адаптируем
if echo "$QUERY" | grep -qi "кондиционер\|climat\|AC\|split"; then
  PL_QUERY="klimatyzacja multisplit montaż Kraków cennik 2025 2026"
  RU_QUERY="кондиционер мультисплит монтаж Краков цена 2025"
  UK_QUERY="кондиціонер мультисплит монтаж Краків ціна 2025"
  EN_QUERY="multi split air conditioner installation cost Krakow Poland 2025"
elif echo "$QUERY" | grep -qi "рекупер\|rekupera\|вентил"; then
  PL_QUERY="rekuperacja montaż Kraków cennik koszt 2025 2026"
  RU_QUERY="рекуператор монтаж Краков цена 2025"
  UK_QUERY="рекуператор монтаж Краків ціна 2025"
  EN_QUERY="heat recovery ventilation installation cost Krakow Poland 2025"
elif echo "$QUERY" | grep -qi "плитк\|glazur\|kafel"; then
  PL_QUERY="glazurnik układanie płytek kafelkowanie Kraków cennik opinie 2025"
  RU_QUERY="плиточник укладка плитки Краков цена 2025"
  UK_QUERY="плиточник укладка плитки Краків ціна 2025"
  EN_QUERY="tile installation contractor cost per sqm Krakow Poland 2025"
fi

# ---------- функция запуска одного lane ----------
run_lane() {
  local lane="$1"
  local query="$2"
  local outfile="$3"

  gemini -m "$MODEL" \
    --yolo \
    -p "${LANE_PROMPT}

LANE: ${lane}
QUERY: ${query}

IMPORTANT: PL/uk means search in POLISH context (country=PL) with Ukrainian language content.
Do NOT search Ukrainian websites (olx.ua, rozetka.ua).
Return ONLY the JSON block, nothing else." \
    2>/dev/null > "$outfile" &
}

# ---------- запускаем все 4 lanes параллельно ----------
echo ""
echo "Running 4 lanes in parallel..."
run_lane "PL/pl" "$PL_QUERY" "$TMPDIR_LANES/pl.json"
run_lane "PL/ru" "$RU_QUERY" "$TMPDIR_LANES/ru.json"
run_lane "PL/uk" "$UK_QUERY" "$TMPDIR_LANES/uk.json"
run_lane "US/en" "$EN_QUERY" "$TMPDIR_LANES/en.json"

wait
echo "All lanes done. Merging..."
echo ""

# ---------- merge: собираем все результаты ----------
ALL_RESULTS=""
for lane_file in "$TMPDIR_LANES/pl.json" "$TMPDIR_LANES/ru.json" "$TMPDIR_LANES/uk.json" "$TMPDIR_LANES/en.json"; do
  if [ -s "$lane_file" ]; then
    ALL_RESULTS="${ALL_RESULTS}
---LANE RESULT---
$(cat "$lane_file")"
  fi
done

# ---------- финальный merge + дедупликация ----------
MERGE_PROMPT="You are a search result merger. You receive JSON results from 4 parallel search lanes and must deduplicate and merge them into one clean report.

Input: JSON blocks from 4 lanes (PL/pl, PL/ru, PL/uk, US/en).

Your job:
1. Deduplicate URLs — if same URL appears in multiple lanes, keep once and merge all facts
2. Merge data about same company from different lanes
3. Identify conflicts — same topic, different data between lanes
4. Rank sources: aggregator > company > forum > blog
5. Return the final Search Report in this format:

## Search Report
**Query:** [original query]
**Lanes used:** [list]

### Sources by Type
#### Aggregators and Platforms
#### Companies / Services (with contacts if found)
#### Forums and Real Experience
#### Official / Legal

### Key Facts
- [fact — source url]

### Prices
| Item | Range (zl) | Source |
|------|-----------|--------|

### Conflicts
- [topic]: Source A says X vs Source B says Y

### Not Found
- [gaps]

Return ONLY the report, no preamble."

gemini -m "$MODEL" \
  --yolo \
  -p "${MERGE_PROMPT}

User query: ${QUERY}

Lane results:
${ALL_RESULTS}" \
  2>/dev/null
