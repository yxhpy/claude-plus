---
name: quick-review
description: Quick code review using Codex. Use when the user asks for a code review or wants to analyze recent changes.
---

# Codex Quick Review

Run a fast code review on the current changes using Codex.

## What to do

1. Check the current git status to see what files have changed
2. Run `codex review` to analyze the changes
3. Present the findings in a clear, actionable format

## Review Focus

If the user provides arguments via `$ARGUMENTS`, use them to focus the review:

- `security` - Focus on security issues
- `performance` - Focus on performance optimization
- `style` - Focus on code style and best practices
- `all` - Comprehensive review (default)

## Command to execute

```bash
codex review $ARGUMENTS
```

Present the results with:
- Summary of findings
- Critical issues (if any)
- Recommendations
- Next steps
