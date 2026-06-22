#!/usr/bin/env bash
# PreToolUse guard: запрещает создавать/писать .md вне baza_znaniy/.
# Разрешены в корне только AGENT.md, main.md, README.md и файлы-указатели
# для других моделей (AGENTS.md, GEMINI.md, CLAUDE.md).
# Вход: JSON события Claude Code на stdin. Решение — через exit code:
#   0  = разрешить
#   2  = заблокировать (stderr показывается агенту как причина)
set -euo pipefail

input="$(cat)"

# Достаём путь файла из tool_input (Write/Edit/MultiEdit кладут его в file_path).
path="$(printf '%s' "$input" | jq -r '.tool_input.file_path // empty')"

# Нет пути или не .md — не наше дело.
[ -z "$path" ] && exit 0
case "$path" in
  *.md) ;;
  *) exit 0 ;;
esac

base="${path##*/}"

# Внутри базы знаний — всегда ок.
case "$path" in
  */baza_znaniy/*) exit 0 ;;
esac

# Разрешённые корневые файлы.
case "$base" in
  AGENT.md|AGENTS.md|GEMINI.md|CLAUDE.md|main.md|README.md) exit 0 ;;
esac

# Всё прочее — блокируем.
echo "Заметки базы знаний должны лежать в baza_znaniy/<домен>/. Путь '$path' вне базы. См. раздел «Куда сохранять» в AGENT.md." >&2
exit 2
