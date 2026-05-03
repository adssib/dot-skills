---
name: docs
description: >
  Use this skill when the user wants to create or update project documentation, add a diagram,
  document a new flow, or keep docs in sync after a major change. Trigger on: "add a diagram",
  "document this flow", "update the docs", "draw a sequence diagram", "what flows should we document",
  "keep docs up to date". Also trigger proactively when a major component, integration, or user-facing
  flow is added or significantly changed — suggest updating docs without waiting to be asked.
---

# Docs

This skill defines what to document, how to document it, and when to update it.

## What Gets Documented

**Yes — document these:**
- User-facing flows (onboarding, main feature, feedback loops)
- System flows (data pipelines, training pipelines, request/response lifecycle)
- Integration flows (how services talk to each other, external APIs, queues)
- Any flow where the "how does this all fit together" question isn't obvious from the code

**No — don't document these:**
- Individual functions or classes (code is the doc)
- Implementation details (how a function works internally)
- Temporary state or in-progress work
- Anything that would need updating every time a variable is renamed

## Format

**PlantUML sequence diagrams** — one file per major flow.

Why sequence diagrams over other formats:
- They show *time* and *order* — who calls who, and when
- They handle async flows, loops, and alt branches naturally
- They stay readable at the system level without collapsing into code detail

### File Naming

```
docs/
  01_<flow_name>.puml
  02_<flow_name>.puml
  ...
```

- Numbered in logical order (not creation order — the order a new reader would want to understand them)
- Snake case, descriptive: `training_pipeline`, `query_generation_flow`, `onboarding_flow`
- `.puml` extension

### Standard Skinparam Block

Always use this at the top — keeps all diagrams visually consistent:

```plantuml
skinparam backgroundColor #FAFAFA
skinparam sequenceArrowThickness 2
skinparam roundcorner 10
```

### Participant Types

Use the right PlantUML keyword for each component:

| Component type | Keyword |
|---|---|
| Human user or developer | `actor` |
| Service, script, or process | `participant` |
| Database, file store, cache | `database` |
| External system or API | `participant` (with clear label) |

### Level of Detail

- Label arrows with **what is sent**, not how it's implemented
  - Good: `POST /api/query\n{session_id, question}`
  - Bad: `calls query_generator.generate(prompt, tokenizer, max_tokens=512)`
- Component names match the actual file/service names — no aliases that drift from the codebase
- Use `alt` blocks for branching paths (happy path first, then failure/edge cases)
- Use `loop` blocks for repeated steps
- Use `note` for important context that doesn't fit on an arrow

## When to Update Docs

Update a diagram when:
- A new component is added to the flow
- An existing component is renamed or removed
- The order of operations changes
- A new alt branch is added (new error state, new user path)

Do NOT update for:
- Internal refactors that don't change the flow
- Renaming a variable or function
- Performance improvements with same behavior

## Workflow: Adding a New Diagram

1. Identify which flow needs documenting — name it from the user's perspective, not the code's
2. List the actors and components involved
3. Draft the happy path first (straight line, no branches)
4. Add alt/loop blocks for edge cases
5. Number the file so it fits logically in the existing sequence
6. Apply the standard skinparam block

## Workflow: Updating an Existing Diagram

1. Read the current diagram first
2. Make only the changes that reflect the actual flow change — don't clean up unrelated things
3. Keep numbering stable — don't renumber just because something was added in the middle
