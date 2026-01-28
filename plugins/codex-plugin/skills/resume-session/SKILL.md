---
name: resume-session
description: Resume a previous Codex session. Use when the user wants to continue a previous Codex interactive session.
---

# Resume Codex Session

Resume a previous Codex interactive session.

## What to do

1. If `$ARGUMENTS` is provided, use it as the session identifier
2. If no arguments, show the session picker by running `codex resume`
3. If `$ARGUMENTS` is "last", resume the most recent session with `codex resume --last`

## Commands

**Show session picker:**
```bash
codex resume
```

**Resume specific session:**
```bash
codex resume $ARGUMENTS
```

**Resume last session:**
```bash
codex resume --last
```

Execute the appropriate command and help the user continue their previous work.
