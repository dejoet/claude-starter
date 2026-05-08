# claude-starter

Boilerplate-repo voor nieuwe projecten met Claude Code. Bevat klaargezet:

- ✅ **CLAUDE.md** — Anthropic-conform (<150 regels, @-imports, niet-doen-lijst)
- ✅ **`.claude/settings.json`** — permissies + 4 hooks (security, format, context, stop)
- ✅ **5 hook-scripts** in `scripts/` — security-check, auto-format, session-context, stop-reminder, deeldoc-reminder
- ✅ **ESLint v9 flat-config** met security-rules
- ✅ **`.gitignore`** standaard
- ✅ **GitHub Action** dependency-audit (push + PR + dagelijks)
- ✅ **`package.json`** met audit/lint/format/test scripts
- ✅ **`docs/ARCHITECTURE.md`** template

---

## Hoe gebruiken — 3 manieren

### Manier 1: GitHub template (aanbevolen, 1 minuut)

```bash
# 1. Push deze map als nieuwe GitHub repo
cd ~/Bureaublad/claude-starter
git init && git add . && git commit -m "initial boilerplate"
gh repo create claude-starter --public --source=. --push

# 2. Markeer als template
gh repo edit --template=true

# 3. Voor elk volgend project:
gh repo create mijn-nieuw-project --template <jouw-username>/claude-starter --private --clone
cd mijn-nieuw-project
# Klaar — alle hooks/CLAUDE.md/etc. al ingericht.
```

### Manier 2: Clone + reset (geen GitHub-template nodig)

```bash
git clone https://github.com/<jij>/claude-starter.git mijn-project
cd mijn-project
rm -rf .git
git init
# Pas CLAUDE.md aan met project-specifieke info
git add . && git commit -m "chore: initial project setup"
```

### Manier 3: Lokaal kopiëren

```bash
cp -r ~/Bureaublad/claude-starter ~/projecten/mijn-project
cd ~/projecten/mijn-project
# Wijzig CLAUDE.md, package.json name, etc.
git init && git add . && git commit -m "init"
```

---

## Na het clonen — eerste stappen

1. **Bewerk `CLAUDE.md`** — vervang `<PROJECT-NAAM>` en vul project-specifieke principes in.
2. **Bewerk `package.json`** — naam + dependencies.
3. **Bewerk `docs/ARCHITECTURE.md`** — vul project-overzicht in.
4. **Pas `scripts/deeldoc-reminder.sh` aan** als je deeldocs gebruikt.
5. **Maak scripts executable:**
   ```bash
   chmod +x scripts/*.sh
   ```
6. **Test hooks lokaal:**
   ```bash
   echo '{"tool_input":{"command":"rm -rf public/*"}}' | bash scripts/security-check.sh
   # Verwacht: deny-output + exit-code 2
   ```
7. **Eerste commit + push:**
   ```bash
   git add .
   git commit -m "chore: initial project setup with Claude Code boilerplate"
   git push
   ```
8. **Start Claude Code:**
   ```bash
   claude
   ```

---

## Wat NIET in deze boilerplate zit

- **Test-runner** — kies zelf jest, vitest, mocha, jsdom-batterij, etc.
- **Cloud-platform-config** — geen Firebase/AWS/Vercel-specifieke files.
- **Framework-keuze** — geen React/Vue/Svelte. Voeg toe na clone.
- **CI deploy-pipeline** — alleen audit. Voeg deploy.yml toe per platform.

---

## Verwijzingen

- Anthropic Claude Code best-practices: https://code.claude.com/docs/en/best-practices
- Hooks documentatie: https://code.claude.com/docs/en/hooks-guide
- Skills documentatie: https://code.claude.com/docs/en/skills
- MCP servers: https://code.claude.com/docs/en/mcp
