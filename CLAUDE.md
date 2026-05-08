# CLAUDE.md — <PROJECT-NAAM>

> Beknopte instructies voor Claude Code. Diepe technische documentatie:
> @docs/ARCHITECTURE.md
>
> Gebaseerd op Anthropic best-practices: code.claude.com/docs/en/best-practices

---

## Principes

1. **Eenvoud boven complexiteit** — geen overbodige abstracties.
2. **Modulair** — één feature, één bestand.
3. **NL** — comments + variabelenamen in het Nederlands.
4. **Schaalbaar** — nieuwe features volgen bestaande patronen.
5. **Veilig** — XSS-preventie; nooit `alert()`/`confirm()` in browser-code.

---

## Pre-commit workflow (verplicht in deze volgorde)

```bash
npx prettier --write <gewijzigde bestanden>   # formatting
npm run lint                                  # ESLint v9
npm run audit:ci                              # faalt bij high/critical CVE's
npm test                                      # test-suite
```

---

## Tests

- **Test-runner:** `<vul in: jest / vitest / jsdom-batterij / etc.>`
- **Locatie:** `<vul in: tests/ / __tests__/ / etc.>`
- **Lokaal:** `npm test`

---

## Codeerconventies

- **ES Modules** in browser-code (geen CommonJS).
- **Comments + variabelen in NL** (init*/render*/load* mogen Engels).
- **CSS-variabelen voor kleuren** — nooit hardcoded `#fff`/`white`.
- **`_esc()` of equivalent** bij `innerHTML` met user-data.
- **Geen secrets in code** — gebruik environment variables / Secret Manager.

---

## Niet-doen

- ❌ `alert()` / `confirm()` — gebruik notificatie-helper.
- ❌ Hardcoded kleuren in inline styles.
- ❌ `innerHTML` met user-data zonder escape.
- ❌ Secrets in code.
- ❌ `--no-verify` op git commits.

---

## Repository conventies

- **Branch:** `main` is productie.
- **Commit-messages:** conventional commits (`feat:`, `fix:`, `chore:`, `docs:`, `style:`).
- **NL-tekst toegestaan** in commit-body.
- **Co-Authored-By bij Claude-commits.**

---

## Verwijzingen

- @docs/ARCHITECTURE.md — Hoog-niveau architectuur.
- @docs/SECURITY.md — (Optioneel) Threat-model + secrets + DR.
- @docs/PRIVACY.md — (Optioneel) AVG-verwerkings-register.
