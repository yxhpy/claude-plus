---
description: Resume a previous Codex session
disable-model-invocation: false
---

# Codex Resume Session

Resume a previous Codex session to continue work or review results.

## Usage

```
/codex:resume [session]
```

## Arguments

- `session` (optional): Session identifier
  - Omit to show session picker
  - `last` to resume the most recent session
  - `<session-id>` to resume a specific session

## What to do

1. If no session specified, run `codex resume` to show picker
2. If `last` specified, run `codex resume last`
3. If session ID specified, run `codex resume <session-id>`
4. Present the session information and status

## Examples

```bash
# Show session picker
codex resume

# Resume last session
codex resume last

# Resume specific session
codex resume abc123
```
