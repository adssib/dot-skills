---
name: readme
description: >
  Use this skill when the user wants to create or update a README.md. Trigger on: "write a readme",
  "add a readme", "update the readme", "generate a readme". Also trigger as part of project-setup
  when scaffolding a new project — every project gets a README on day one.
  README is outward-facing (other devs, HRs, managers) — never use "we", never reference Claude,
  never include internal notes.
---

# Readme

A README is a public-facing document. It is NOT a dev journal, NOT a CLAUDE.md, NOT a PROJECT.md.
It answers one question for someone who just landed on the repo: "what is this and does it matter to me?"

Keep it short. Point to other files for detail. Never repeat what PROJECT.md or CLAUDE.md already say.

---

## Step 1: Identify Project Type

Ask or infer from context. The type determines which sections to include.

| Type | Examples |
|---|---|
| Portfolio / learning | AskDB, Atlas-MCP — built to learn and show to employers |
| Open-source | Public tool others will use and contribute to |
| Team project | Internal or collaborative project with multiple contributors |

A project can be more than one (portfolio + open-source). When in doubt, ask.

---

## Step 2: Write the Header

**Always:**
- Project name as `# Title`
- 1 punchy sentence: what it does
- 1 sentence: what makes it non-generic (the interesting technical decision, not "it uses AI")

**Never:**
- "This project is..." (start with what it does, not "this project")
- "We built..." (outward-facing, no "we")
- Buzzword soup ("leverages cutting-edge AI to...")

---

## Step 3: Include Sections by Type

### Always include (every project type)

#### Demo
```markdown
## Demo
> _GIF or screenshot coming soon_
<!-- ![demo](docs/demo.gif) -->
```
Use a placeholder if not ready. A commented-out line signals it's coming, not forgotten.

#### Status Badges
```markdown
## Status
![CI](https://img.shields.io/badge/CI-not%20set%20up-lightgrey)
![SonarQube](https://img.shields.io/badge/SonarQube-not%20set%20up-lightgrey)
```
Use grey placeholder badges until CI/SonarQube are wired up. Replace with real badge URLs when ready.

#### How to Run
Minimal — just the commands, no prose. If setup is complex, link to a separate doc.

#### Pointers at the bottom
```markdown
- **Architecture & build plan** → [`PROJECT.md`](PROJECT.md)
- **Development conventions** → [`CLAUDE.md`](CLAUDE.md)
```

---

### Portfolio / Learning projects — add these

#### Live / Deployment
```markdown
## Live
| | |
|---|---|
| App | _not deployed yet_ |
| API | _not deployed yet_ |
```
Fill in real URLs when deployed. Keep the table even when empty — signals it's planned.

#### Model Performance (ML projects only)
```markdown
## Model Performance
| Metric | Base Model | Fine-Tuned |
|---|---|---|
| Execution Accuracy | _TBD_ | _TBD_ |
| Exact Match | _TBD_ | _TBD_ |
```
Always include both before and after — shows you ran a baseline, not just trained blindly.
Add a one-line training summary below the table: dataset size, model, method, hardware.

---

### Open-source projects — add these

#### Installation
Proper install instructions (pip, npm, brew, etc.)

#### Contributing
```markdown
## Contributing
Open an issue before opening a PR. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.
```

#### License
```markdown
## License
[MIT](LICENSE)
```

---

### Team projects — add these

#### Contributing / PR process
Link to CONTRIBUTING.md or describe the branch + PR flow briefly.

---

## Step 4: Tone Check

Before finishing, scan for:
- Any "we" → replace with "the project", the tool name, or rewrite the sentence
- Any internal language ("as per our CLAUDE.md", "Claude writes X") → remove
- Any sentence that repeats PROJECT.md verbatim → cut it, add a link instead
- Any section longer than ~5 lines → it probably belongs in PROJECT.md, not here

---

## Section Order

```
# Title
one-liner
what makes it interesting

## Demo
## Live          (portfolio/open-source)
## Status
## Model Performance  (ML projects only)
## How to Run
## Contributing  (open-source/team)
## License       (open-source)

---
- Architecture → PROJECT.md
- Dev conventions → CLAUDE.md
```
