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
| `.bashrc` configures your terminal | `steering/` configures your AI sessions |
| `.gitconfig` sets your git preferences | `project-init/` sets your project scaffolding style |
| Portable across machines | Portable across projects and conversations |

---

## Repo Structure

```
dotskills/
├── README.md
├── install.sh                 # Adds a symlink of the skills folder to a destination folder
├── project-setup/             # Session & project configuration skill
│   ├── SKILL.md               # Main skill instructions
│   └── references/
│       ├── claude-md.md       # Template + rules for generating CLAUDE.md files
│       └── project-md.md      # Template + rules for generating PROJECT.md files
│
├── git-setup/                 # Git conventions & workflow skill
│   └── SKILL.md               # Branching, commits, rebase policy, .gitignore
│
├── docs/                      # Documentation conventions skill
│   └── SKILL.md               # PlantUML sequence diagrams, naming, when to update
│
└── (future skills go here)
```

---

## How to Use

### With Claude Code

Drop the skill into your Claude Code skills directory or reference it directly:

```bash
# Clone into your skills directory
git clone https://github.com/adssib/dot-skills.git
chmod +x dot-skills/install.sh

# Install all skills into a project
./dot-skills/install.sh ~/projects/atlas-mcp

# Or install specific skills only
./dot-skills/install.sh ~/projects/atlas-mcp git-setup docs
```

Skills are symlinked into `.claude/skills/` — Claude Code picks them up automatically on next session.

Then in any project, tell Claude:

> "Use the project-setup skill to set up this project. Here's what I'm building: ..."

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

- `code-review/` — How I want Claude to review my PRs
- `debug/` — My preferred debugging workflow (reproduce → isolate → fix → test)
- `docs/` — How I want documentation written (tone, structure, examples)
- `refactor/` — Rules for when and how to refactor vs rewrite
- Have a better idea? Drop it in an issue! 

---

## Contributing

This is personal workflow stuff, so PRs might not make sense, but if you fork this and build your own dotskills, I'd love to see what you come up with. Open an issue and share your repo.

---

*Inspired by the dotfiles tradition. Built for the age of AI-assisted development.*
