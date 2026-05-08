# ARCHITECTURE.md — <PROJECT-NAAM>

> Hoog-niveau technische referentie. Voor werkrichtlijnen zie `../CLAUDE.md`.

---

## Projectoverzicht

**<Eén alinea: wat doet het project, voor wie, hoofd-tech.>**

- **URL:** <productie-URL>
- **Stack:** <bv. Firebase Hosting + Firestore + Cloud Functions Node 22>
- **Repo:** <github.com/...>

---

## Mapstructuur

```
<project-root>/
├── CLAUDE.md          # Claude-instructies (kort)
├── README.md          # Mens-leesbare overview + setup
├── docs/
│   ├── ARCHITECTURE.md  # Dit bestand
│   ├── SECURITY.md      # Threat-model + DR (optioneel)
│   └── <deel>.md        # Per-onderdeel diepe doc (bij grote codebases)
├── .claude/
│   └── settings.json    # Hooks + permissies
├── scripts/             # Hook-scripts + helpers
├── .github/workflows/   # CI (audit, tests, deploy)
├── eslint.config.mjs    # Lint-config
├── package.json
└── <src/ of public/>    # Code
```

---

## Architectuur-decisions

Documenteer hier waarom je voor bepaalde patterns gekozen hebt:

- **Firebase modulaire SDK** — geen compat (kleinere bundles).
- **ES Modules** — geen CommonJS in browser-code.
- **Cloud Functions region** — `<vul in>` (data-residency).
- **Auth-strategie** — `<bv. Firebase Auth + email/wachtwoord>`.
- **Test-strategie** — `<bv. jsdom-batterij voor unit, Playwright voor E2E>`.

---

## Cross-cutting concerns

- **Logging** — `<waar gaan logs heen, wat wordt geredacteerd>`
- **Secrets** — `<Secret Manager / .env / etc.>`
- **CI/CD** — `<welke triggers, welke checks>`
- **Backup / DR** — `<RPO/RTO + procedure>`

---

## Deeldocumentatie (voor grote projecten)

Bij codebases >5k regels: deel op in deeldocs en list hier.

| Deel | Document | Scope |
|---|---|---|
| `<deel-1>` | [docs/<deel-1>.md](<deel-1>.md) | `<paths>` |
