---
description: Execute Codex tasks non-interactively
disable-model-invocation: false
---

# Codex Execute

Execute a Codex task non-interactively with appropriate safety settings.

## Usage

```
/codex:exec <task description>
```

## Arguments

- `task description`: The task you want Codex to execute

## What to do

1. Analyze the task to determine appropriate sandbox mode:
   - Read-only for exploration/analysis tasks
   - Workspace-write for tasks that need to modify files
2. Execute using `codex exec` with appropriate flags
3. Report the results clearly

## Examples

```bash
# Analyze code (read-only)
codex exec --sandbox read-only "analyze project structure"

# Run tests (workspace-write)
codex exec --sandbox workspace-write "run all unit tests"

# Generate documentation (workspace-write)
codex exec --sandbox workspace-write "update README with API docs"
```

## Safety

- Start with read-only sandbox for exploration
- Only use workspace-write when modifications are needed
- Never use unsafe flags unless explicitly requested
