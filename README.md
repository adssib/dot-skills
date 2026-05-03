# dotskills

> Looks like a dotfile, not a dotfile — it's a dotskill!
> Same spirit, different purpose.
> In a nutshell, a list of processes me & Claude agreed upon.

---

## What is this?

Dotfiles configure your shell. Dotskills configure your AI.

This repo is a collection of reusable [Claude Skills](https://docs.anthropic.com) — structured instructions that teach Claude *how* to work with me across projects. Instead of re-explaining my workflow every time I start a new project, I point Claude to a skill and we're immediately in sync.

Think of it like this:

| dotfiles | dotskills |
|----------|-----------|
| `.bashrc` configures your terminal | skills configure your AI sessions |
| `.gitconfig` sets your git preferences | `project-setup/` sets your project scaffolding style |
| Portable across machines | Portable across projects and conversations |

---

## Repo Structure

```
dotskills/
├── README.md
├── SKILLS.md                  # Index of all available skills
├── install.sh                 # Symlinks this repo into a project so Claude can read it
├── project-setup/             # Core skill: scaffolds CLAUDE.md, PROJECT.md, git, and docs
│   ├── SKILL.md
│   └── references/
│       ├── claude-md.md       # Template + rules for generating CLAUDE.md files
│       └── project-md.md      # Template + rules for generating PROJECT.md files
├── git-setup/                 # Git conventions: branching, commits, .gitignore
│   └── SKILL.md
├── docs/                      # Documentation conventions: PlantUML diagrams, what to document
│   └── SKILL.md
└── readme/                    # README generation: sections by project type, placeholder patterns
    └── SKILL.md
```

---

## How to Use

### Install into a project

```bash
# Install all skills
./install.sh ~/projects/atlas-mcp

# Or install specific skills only
./install.sh ~/projects/atlas-mcp git-setup docs
```

This symlinks each skill into `~/projects/atlas-mcp/.claude/skills/` — the path Claude Code reads for project-level skills. It also adds `.claude/skills/` to the project's `.gitignore` automatically.

Then in any session in that project, tell Claude:

> "Use the project-setup skill to scaffold this project."

### Use a skill directly (no install)

In any Claude Code session, reference the skill by path:

> "Read `~/git-repos/dot-skills/project-setup/SKILL.md` and use it to set up this project."

---

## Philosophy

**Why skills instead of just copy-pasting prompts?**

Because prompts are throwaway. Skills are maintained. I kept copy-pasting the same CLAUDE.md preamble into every project, tweaking it slightly each time, losing track of which version was best. Skills solve that — one source of truth, version controlled, improvable.

**Why "steering"?**

Because that's what it is. Claude is the engine, I'm the driver. The skill doesn't replace my judgment — it just makes sure Claude and I are aligned on *how* we work together before we start *what* we're building.

**Why public?**

Same reason people share dotfiles (I do too). Maybe my workflow helps someone else. Maybe someone has a better pattern I can steal. Open source the process, not just the product.

---

## Future Skills (ideas)

- `debug/` — My preferred debugging workflow (reproduce → isolate → fix → test)
- `review/` — How I want Claude to review my PRs
- `refactor/` — Rules for when and how to refactor vs rewrite
- `test/` — When to write tests, what to test, what not to mock
- Have a better idea? Drop it in an issue!

---

## Contributing

This is personal workflow stuff, so PRs might not make sense, but if you fork this and build your own dotskills, I'd love to see what you come up with. Open an issue and share your repo.

---

*Inspired by the dotfiles tradition. Built for the age of AI-assisted development.*
