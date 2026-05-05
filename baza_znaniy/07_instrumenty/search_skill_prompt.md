# Multilingual Search Skill — Orchestrator

> Этот файл — инструкции для Opus-оркестратора.
> Субагентные промпты: `search_skill_lane_prompt.txt`
> Gemini CLI: `search_skill_gemini.sh`
> Codex CLI: `search_skill_codex.sh`

---

## Архитектура

```
Пользователь: "загугли X"
      │
      ▼
  Opus (оркестратор)
      │
      ├── определяет тип запроса и нужные lanes
      ├── адаптирует запросы под каждый язык
      │
      ├── [в одном сообщении, параллельно]:
      │   ├── Agent(haiku): PL/pl → compact JSON
      │   ├── Agent(haiku): PL/ru → compact JSON
      │   ├── Agent(haiku): PL/uk → compact JSON
      │   └── Agent(haiku): US/en → compact JSON
      │
      ├── получает 4 JSON результата
      ├── дедуплицирует URL между lanes
      ├── объединяет факты об одном источнике
      ├── находит конфликты
      │
      └── пишет финальный ответ пользователю на русском
```

---

## Шаг 1: Определить тип запроса

| Тип | Lanes | Когда |
|-----|-------|-------|
| `market` | PL/pl + PL/ru + PL/uk + US/en | Покупка, услуги, подрядчики, техника |
| `forums` | PL/pl + PL/ru + PL/uk + US/en | Живой опыт, отзывы, лайфхаки |
| `official` | PL/pl + US/en | Законы, налоги, нормы |
| `docs` | US/en | Технические спецификации |

---

## Шаг 2: Адаптировать запросы (не переводить — адаптировать)

| Lane | Country | Lang | Как адаптировать |
|------|---------|------|-----------------|
| PL/pl | PL | pl | Polish construction terms: ekipa remontowa, wykończenie pod klucz, glazurnik, klimatyzacja, rekuperacja, montaż, cennik, opinie |
| PL/ru | PL | ru | Русские слова + польский контекст: бригада ремонт Краков, кондиционер montaż Польша цена |
| PL/uk | PL | uk | Украинские слова + польский контекст: бригада ремонт Краків, кондиціонер Польща ціна |
| US/en | US | en | Technical English: specs, reviews, comparisons |

---

## Шаг 3: Запустить 4 субагента ПАРАЛЛЕЛЬНО

Все 4 вызова — в ОДНОМ сообщении:

```
Agent(model="haiku", prompt=LANE_PROMPT + "\nLANE: PL/pl\nQUERY: ekipa remontowa Kraków opinie cena")
Agent(model="haiku", prompt=LANE_PROMPT + "\nLANE: PL/ru\nQUERY: бригада ремонт Краков цена отзывы")
Agent(model="haiku", prompt=LANE_PROMPT + "\nLANE: PL/uk\nQUERY: бригада ремонт Краків ціна відгуки")
Agent(model="haiku", prompt=LANE_PROMPT + "\nLANE: US/en\nQUERY: apartment renovation contractors Krakow review 2025")
```

где `LANE_PROMPT` — содержимое файла `search_skill_lane_prompt.txt`.

---

## Шаг 4: Дедупликация (Opus делает сам)

Получив 4 JSON результата:

1. **Убрать дублирующиеся URL** — если один URL встретился в 2+ lanes, оставить один, объединить факты
2. **Объединить данные об одной компании** — если Oferteo нашли в PL/pl и PL/ru, показать один раз со всеми фактами
3. **Найти конфликты** — если PL/pl говорит цена 500 zł/м², а PL/ru говорит 300 zł/м² — отметить конфликт
4. **Ранжировать** — official > aggregator > company > forum > blog

---

## Шаг 5: Финальный ответ пользователю

Opus пишет ответ на **русском языке**, используя дедуплицированные данные:
- Конкретные факты с источниками
- Цены в zł
- Контакты если нашли
- Конфликты если есть
- Чего не нашли

---

## Триггеры для вызова skill

«загугли», «найди в интернете», «поищи», «что есть на рынке», «какие варианты», «сколько стоит», «где купить»
