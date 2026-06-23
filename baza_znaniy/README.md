# База знаний — Ремонт квартиры (Краков)

> Этот файл — навигатор по базе знаний.  
> Агент использует его, чтобы понимать **куда сохранять** новые данные и **где искать** уже собранную информацию.

---

## Структура папок

> **Легенда:** ✅ файл существует · 🔲 запланирован (файла ещё нет — создать при первом наполнении).
> Перед тем как сослаться на файл, агент проверяет, что он реально есть на диске.

```
baza_znaniy/
│
├── README.md                        ← этот файл (навигатор)
│
├── 01_kvartira/                     ← всё о самой квартире
│   └── 🔲 dokumenty.md                 площади по документам (KW, akt notarialny, tech plan)
│       (паспорт квартиры пока в корневом main.md)
│
├── 02_remont_etapy/                 ← этапы ремонта
│   ├── ✅ 00_obshchiy_plan.md          общий план этапов, последовательность работ
│   ├── ✅ 01_demolazh.md               снос, демонтаж, замуровки/проёмы
│   ├── ✅ 02_elektryka.md              электрика
│   ├── ✅ 02_stena_tv_klima.md         возведение стены G-K (ТВ-зона + кондиционеры)
│   ├── ✅ 08_klimatyzacja_rekuperacja.md  кондиционирование и рекуперация
│   ├── 🔲 03_santehnika.md             сантехника / водопровод / канализация (работы)
│   ├── 🔲 04_poly.md                   напольные покрытия (укладка)
│   ├── 🔲 05_steny_potolki.md          стены, потолки, штукатурка, покраска
│   ├── 🔲 06_dveri_okna.md             двери, окна, порталы
│   └── 🔲 07_chistovaya_otdelka.md     финальная отделка, мебель, декор
│
├── 03_materialy/                    ← исследования по материалам (что купить)
│   ├── ✅ inzhenernaya_doska.md        инженерная доска (бренды, характеристики, цены)
│   ├── ✅ santehnika_dush.md           сантехника: душ, гиг. душ, унитаз KOŁO (модели, цены)
│   ├── 🔍 vytyazhka_vannaya.md         вытяжной вентилятор ванной (VENTS vs Awenta)
│   ├── ✅ kafel_obzor.md               навигатор по кафелю + ориентиры цен (ванная / кухня)
│   ├── 🔍 plitka_vannaya.md            кафель ВАННЫХ (Venis/Cerrad/Paradyż/Tubądzin)
│   ├── 🔍 pol_pod_derevo_koridor.md    пол под дерево КУХНЯ/КОРИДОР (Acero/Wildland/Wood Grain)
│   └── 🔲 shtukaturka_kraska.md        штукатурка, грунт, краска
│
├── 04_podradchiki/                  ← подрядчики, фирмы, контакты
│   ├── ✅ podradchiki_krakow.md        список фирм, контакты, оценки
│   ├── ✅ voprosy_podradchiku.md       чек-лист вопросов при первом звонке
│   ├── ✅ issledovanie_podradchikov.md исследование рынка подрядчиков
│   └── ✅ plan_issledovaniya_chastnikov.md план исследования частников vs фирм
│
├── 05_finansy/                      ← бюджет и финансовая стратегия
│   ├── ✅ vat_8_percent.md             схема экономии на VAT 8%
│   ├── ✅ modeli_cenoobrazovaniya.md   модели ценообразования ремонтных фирм
│   ├── ✅ sravnenie_predlozheniy.md    таблица сравнения смет (шаблон)
│   └── 🔲 byudzhet.md                  сводная таблица бюджета по этапам
│
├── 06_pravo_dokumenty/              ← юридика, документы, нормы
│   ├── ✅ normy_powierzchni.md         нормы подсчёта площади в Польше (PN-70, ISO 9836)
│   ├── 🔍 przebicie_sciany_nosnej.md   портал в несущей стене: pozwolenie + экспертиза + wspólnota
│   └── 🔲 biala_lista_vat.md           как проверить фирму (NIP, Biała Lista)
│
├── 07_instrumenty/                  ← инструменты и методологии поиска
│   ├── ✅ search_skill_prompt.md       prompt мультиязычного поискового агента (оркестратор)
│   ├── ✅ search_skill_lane_prompt.txt промпт субагента-lane
│   ├── ✅ search_skill_gemini.sh / search_skill_codex.sh  CLI-обёртки
│   ├── ✅ test_multilingual_search.md  результаты A/B теста поиска
│   ├── ✅ test_haiku_vs_gemini.md      сравнение Haiku vs Gemini
│   └── ✅ scalablejs.md                доступ к ScalableJS и URL remote project
│
├── 08_kuhnya/                       ← всё о кухне (исследования, подрядчики, проекты)
│   ├── centrum_meble/research.md       ✅ анализ конструктора Centrum Meble (Tip-On и т.д.)
│   ├── ✅ magiya_tehnologa_b2b.md      как работает скидка технолога (VIP-прайсы)
│   ├── ✅ sozdanie_proekta_kuhni.md    варианты и стоимость проекта (Viyar и аналоги)
│   ├── ✅ poisk_tehnologa.md           как искать технолога (ТЗ и требования)
│   ├── ✅ mebel_kuhnya_krakow.md       сравнение сервисов распила
│   ├── ✅ elita_kuhnya_razdelnyi_zakaz.md  стратегия раздельного заказа элитной кухни
│   └── ✅ sravnenie_cen_kuhnya.md      предварительный расчёт цен (Киев, Варшава, Краков)
│
└── 09_tumbochka_tv/                 ← саб-проект тумба под ТВ (тестовый полигон)
    └── ✅ proekt_tumby.md              концепция, материалы и расчёт стоимости
```

---

## Правила заполнения (для агента)

| Тип данных                          | Куда сохранять                                      |
|-------------------------------------|-----------------------------------------------------|
| Площади, документы на квартиру      | `01_kvartira/dokumenty.md`                          |
| Замечания с осмотра                 | `01_kvartira/osmotr_zamechaniya.md`                 |
| Общий план этапов ремонта           | `02_remont_etapy/00_obshchiy_plan.md`               |
| Детали конкретного этапа ремонта    | `02_remont_etapy/0X_<название>.md`                  |
| Исследование материала              | `03_materialy/<material>.md`                        |
| Подрядчики, контакты, оценки        | `04_podradchiki/podradchiki_krakow.md`              |
| Исследование рынка подрядчиков      | `04_podradchiki/issledovanie_podradchikov.md`       |
| Чек-лист вопросов подрядчику        | `04_podradchiki/voprosy_podradchiku.md`             |
| Финансы, бюджет                     | `05_finansy/byudzhet.md`                            |
| Стратегия VAT, экономия             | `05_finansy/vat_8_percent.md`                       |
| Сравнение смет                      | `05_finansy/sravnenie_predlozheniy.md`              |
| Юридика, нормы, разрешения          | `06_pravo_dokumenty/`                               |
| Доступы к сервисам / аккаунтам      | `07_instrumenty/`                                   |
| Всё о кухне (техника, мебель, распил)| `08_kuhnya/`                                        |
| Саб-проект тумба под ТВ             | `09_tumbochka_tv/`                                  |

---

## Статус заполнения

| Файл                                          | Статус        | Дата обновления |
|-----------------------------------------------|---------------|-----------------|
| `06_pravo_dokumenty/normy_powierzchni.md`     | ✅ Готов      | 2026-04-23      |
| `06_pravo_dokumenty/przebicie_sciany_nosnej.md` | 🔍 В работе | 2026-06-22      |
| `03_materialy/inzhenernaya_doska.md`          | ✅ Готов      | 2026-04-26      |
| `03_materialy/santehnika_dush.md`             | 🔍 В работе   | 2026-06-23      |
| `03_materialy/vytyazhka_vannaya.md`           | 🔍 В работе   | 2026-06-23      |
| `03_materialy/kafel_obzor.md`                 | ✅ Готов      | 2026-06-23      |
| `03_materialy/plitka_vannaya.md`              | 🔍 В работе   | 2026-06-23      |
| `03_materialy/pol_pod_derevo_koridor.md`      | 🔍 В работе   | 2026-06-23      |
| `04_podradchiki/podradchiki_krakow.md`        | ✅ Готов      | 2026-04-26      |
| `04_podradchiki/voprosy_podradchiku.md`       | ✅ Готов      | 2026-04-26      |
| `04_podradchiki/issledovanie_podradchikov.md` | ✅ Готов      | 2026-04-26      |
| `04_podradchiki/plan_issledovaniya_chastnikov.md` | ✅ Готов  | 2026-04-26      |
| `08_kuhnya/centrum_meble/research.md`         | ✅ Готов      | 2026-05-03      |
| `08_kuhnya/magiya_tehnologa_b2b.md`           | ✅ Готов      | 2026-05-03      |
| `08_kuhnya/sozdanie_proekta_kuhni.md`         | ✅ Готов      | 2026-05-03      |
| `08_kuhnya/poisk_tehnologa.md`                | ✅ Готов      | 2026-05-03      |
| `08_kuhnya/mebel_kuhnya_krakow.md`            | ✅ Готов      | 2026-05-03      |
| `08_kuhnya/elita_kuhnya_razdelnyi_zakaz.md`   | ✅ Готов      | 2026-05-03      |
| `08_kuhnya/sravnenie_cen_kuhnya.md`           | ✅ Готов      | 2026-05-03      |
| `09_tumbochka_tv/proekt_tumby.md`             | ✅ Готов      | 2026-05-03      |
| `07_instrumenty/scalablejs.md`                | ✅ Готов      | 2026-05-05      |
| `07_instrumenty/search_skill_prompt.md`       | ✅ Готов      | 2026-04-27      |
| `07_instrumenty/test_multilingual_search.md`  | ✅ Готов      | 2026-04-27      |
| `07_instrumenty/test_haiku_vs_gemini.md`      | ✅ Готов      | 2026-04-28      |
| `05_finansy/vat_8_percent.md`                 | ✅ Готов      | 2026-04-26      |
| `05_finansy/modeli_cenoobrazovaniya.md`       | ✅ Готов      | 2026-04-26      |
| `02_remont_etapy/00_obshchiy_plan.md`         | ✅ Готов      | 2026-04-26      |
| `02_remont_etapy/01_demolazh.md`              | ✅ Готов      | 2026-04-26      |
| `02_remont_etapy/02_elektryka.md`             | ✅ Готов      | 2026-04-26      |
| `02_remont_etapy/02_stena_tv_klima.md`        | ✅ Готов      | 2026-06-17      |
| `02_remont_etapy/08_klimatyzacja_rekuperacja.md` | ✅ Готов   | 2026-06-23      |
| `05_finansy/sravnenie_predlozheniy.md`        | ✅ Шаблон     | 2026-04-26      |
| `01_kvartira/dokumenty.md`                    | 🔲 Заглушка   | 2026-06-22      |
| `05_finansy/byudzhet.md`                      | 🔲 Не начат   | —               |
