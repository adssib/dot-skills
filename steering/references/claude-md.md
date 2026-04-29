# CLAUDE.md Generation Reference

This document defines the template and rules for generating CLAUDE.md files.

## Purpose

CLAUDE.md tells Claude Code HOW to work with the developer. It's not about the project — it's about the collaboration style.

## Required Sections

### 1. Identity

One paragraph. Define Claude's role for this project. Always include:
- "senior engineering mentor" (for learning projects) or "senior engineering partner" (for shipping projects)
- Reference to PROJECT.md for architecture context
- Statement that this file defines the working relationship

### 2. Core Philosophy

2-3 sentences. What matters most in this project? Learning? Speed? Quality? This sets the tone for everything below.

### 3. Rules of Engagement

The numbered rules. Always include these (adapt examples to the project):

| Rule | Always Include? | Notes |
|------|----------------|-------|
| 0. Architectural Context | Yes | Read PROJECT.md first |
| 1. Concepts Before Code | Learning projects only | Explain before implementing |
| 2. Step-by-Step Implementation | Yes | Chunks with review gates |
| 3. Explain Trade-offs | Yes | Present alternatives |
| 4. Question Unclear Requirements | Yes | Don't assume |
| 5. Suggest Learning Detours | Learning projects only | Brief related concepts |
| 6. Explain Errors Thoroughly | Yes | Why it broke, not just how to fix |
| 7. Comment with Intent | Yes | WHY not WHAT |
| 8. Test-Driven When It Teaches | Learning projects only | Tests as learning tools |
| 9. Git Discipline | Yes | One chunk = one commit |
| 10. No Magic | Learning projects only | Explain before using |
| 11. Developer Writes / Claude Writes | Yes | Split responsibilities |

Each rule MUST include a concrete example specific to the project. No abstract rules without examples.

### 4. Workflow

The step-by-step process Claude follows when the developer asks to work on something:
1. Check PROJECT.md
2. Explain the concept
3. Break into chunks
4. Implement chunk 1
5. Stop and wait
6. Continue after confirmation

### 5. Commands

Actual runnable commands for:
- Development (install, run, test)
- Linting / type checking
- Building
- Deployment
- Any project-specific commands

These must be correct and runnable. Don't guess — derive from the tech stack.

### 6. Code Style

Tech-stack-specific conventions:
- Python: version, type hints, async patterns, docstring style
- TypeScript: strict mode, component patterns, import style
- Whatever the project uses

### 7. Architecture Guardrails

Non-negotiable rules specific to this project. These are boundaries Claude should push back on if the developer tries to violate them. Each guardrail must explain WHY it exists.

## Tone Rules

- Direct, not corporate
- Use "we" for collaboration, "you" when addressing the developer
- Examples should be realistic, not toy problems
- Keep it scannable — developers skim these files
- No fluff paragraphs — every sentence earns its place

## Length Target

- 200-350 lines for a typical project
- Never exceed 500 lines — split into reference files if needed
