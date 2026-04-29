# PROJECT.md Generation Reference

This document defines the template and rules for generating PROJECT.md files.

## Purpose

PROJECT.md tells Claude (and the developer) WHAT we're building. Architecture, structure, patterns, build order. It's the source of truth for the project's technical design.

## Required Sections

### 1. Title & One-Liner

Format: `# Project-Name — One sentence description`

The one-liner should be memorable and immediately communicate what the project does. Aim for something someone would put in a GitHub repo description.

### 2. Overview

3-5 sentences covering:
- What the project does (for someone who's never seen it)
- Whether it's a learning project or production project
- What inspired it (if applicable)
- The key insight or differentiator

### 3. Architecture

Must include:
- **ASCII diagram** showing major components and data flow. Keep it simple — boxes and arrows. The reader should understand the system in 10 seconds.
- **Tech stack table** with Category | Technology columns
- **External integrations** (APIs, databases, services) with auth requirements and free tier limits

### 4. Project Structure

Full directory tree with inline comments explaining each file's purpose. This is the most-referenced section — developers come back to this constantly.

Rules:
- Every file gets a comment
- Group by concern (tools/, clients/, tests/)
- Show the full path from project root
- Use consistent naming conventions throughout

### 5. Design Patterns & Principles

Document the key patterns used in the project with:
- Code examples showing the GOOD way (and optionally the BAD way)
- Explanation of WHY this pattern matters for this project
- How to extend the pattern (adding a new tool, a new API client, etc.)

### 6. Build Order

Broken into numbered phases with clear milestones. Each phase should result in something testable or demoable.

Rules:
- Phase 1 should produce a working (if minimal) result as fast as possible
- Each phase builds on the previous — never skip ahead
- Milestones should be concrete: "First screenshot", "All tests passing", "Deployed"
- Number individual steps within each phase
- Later phases can include stretch goals

### 7. Environment Variables

List every env var with:
- Name
- Whether it's required or optional
- What it's for
- Where to get the value (signup URL, etc.)

Use `.env.example` format.

### 8. API/Integration Details (if applicable)

For projects that integrate with external APIs:
- Endpoint URLs
- Auth method
- Rate limits
- Response format summary
- Link to official docs

### 9. Learning Objectives (learning projects only)

Numbered list of what the developer will understand after completing the project. Frame as outcomes, not activities:
- "How MCP transport layers work" not "Implement MCP transport"
- "Why async HTTP matters for tool servers" not "Use httpx"

## Tone Rules

- Technical but approachable
- Use tables for structured comparisons
- Code examples should be real, not pseudocode
- Comments in code examples should teach
- Keep paragraphs short — this is a reference doc, not an essay

## Length Target

- 300-500 lines for a typical project
- Can go longer for complex projects with many integrations
- If exceeding 600 lines, consider splitting integration details into separate reference files

## Anti-Patterns

- Don't include implementation details that belong in code comments
- Don't duplicate what's already in CLAUDE.md (workflow, code style)
- Don't list every possible future feature — keep "stretch goals" to one short section
- Don't include setup instructions that belong in README.md
