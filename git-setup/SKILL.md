---
name: git-setup
description: >
  Use this skill when the user wants to initialize git on a new project, set up a .gitignore,
  make a first commit, decide on a branching strategy, or establish git conventions for a project.
  Trigger on: "set up git", "initialize the repo", "what's our branching strategy", "how should
  we commit", "add a gitignore", "first commit", or any question about git workflow for this project.
---

# Git Setup

This skill establishes git conventions for a project. The goal is consistent, readable history
that reflects actual work — not ceremony for its own sake.

## Branching Strategy

### Solo projects
- Work directly on `master`. No feature branches unless the change is large or experimental enough
  that you want an easy bail-out.
- Occasional branch is fine — use judgment, not rules.

### Team projects
- Always branch. One branch per feature/fix. Branch off `master` (or whatever the team default is).
- Follow the team's branch naming if they have one. If not, use: `feat/short-description` or `fix/short-description`.
- Check the team's GitHub settings (merge strategy, protected branches) before pushing — don't assume.

## Commits

### Format
```
feat(component): what changed and why
fix(component): what changed and why
```

- `component` = the area of the codebase (e.g. `train`, `schema-parser`, `auth`, `api`)
- Message explains **what AND why** — not just "update train.py"
- Each logical chunk of work = one commit. Don't batch unrelated changes.
- Never commit broken code. Every commit should be independently runnable.

### Examples
```
feat(train): add QLoRA adapter with rank 16 — initial fine-tuning setup
fix(schema-parser): handle empty DDL input — was throwing KeyError on None
feat(api): add /query endpoint with intent classification gate
```

## Rebase Policy

Rebase only when:
- The upstream commits don't touch the same files/logic as your local changes
- It's a clean fast-forward with no risk of conflict

Otherwise, regular merge is fine. Don't rebase just because it looks cleaner — only if it's safe.
Always check what's on the remote before deciding.

If the team has a written merge policy (in their GitHub settings or CONTRIBUTING.md), follow that
over everything here.

## .gitignore

Group entries logically — don't dump a 200-line template. Cover:

```
# Secrets & environment
.env
.env.*
*.pem
secrets/

# Language artifacts
__pycache__/
*.pyc
*.pyo
*.egg-info/
dist/
build/
.venv/
venv/
node_modules/
.next/

# Editor & OS
.DS_Store
.idea/
.vscode/
*.swp

# Project-specific large files / data
data/raw/
data/processed/
*.safetensors
wandb/
```

Add project-specific entries as needed. Don't add entries for things that don't exist yet.

## Workflow: Starting a New Repo

1. `git init` + create `.gitignore` (tailored to the stack)
2. First commit: `chore: initial project skeleton`
3. Set remote: `git remote add origin <url>`
4. Push: `git push -u origin master`

## Workflow: Starting a Feature (Team)

1. Pull latest: `git pull origin master`
2. Branch: `git checkout -b feat/short-description`
3. Work in chunks, commit each one
4. Before pushing, check if master moved — rebase only if safe (see Rebase Policy above)
5. Push and open PR. Follow team's PR conventions.

## What Claude Does vs What You Do

- **Claude writes**: the `.gitignore`, initial scaffold commits, boilerplate
- **You decide**: branch names, when to branch, whether to rebase, PR descriptions (project-specific)
- **Claude suggests, you approve**: any destructive git operation (reset, force push, branch delete)
