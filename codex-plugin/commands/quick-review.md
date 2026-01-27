---
description: Quick code review using Codex on current changes
disable-model-invocation: false
---

# Codex Quick Review

Run a fast code review on the current changes using Codex.

## Usage

```
/codex:quick-review [focus]
```

## Arguments

- `focus` (optional): Focus area for the review
  - `security` - Security vulnerabilities
  - `performance` - Performance issues
  - `style` - Code style and best practices
  - `all` - Comprehensive review (default)

## What to do

1. Check git status to see what files have changed
2. Run `codex review` with the specified focus (if any)
3. Present the findings clearly with:
   - Summary of changes reviewed
   - Critical issues found
   - Recommendations
   - Next steps

## Example

```bash
# Review all changes
codex review

# Security-focused review
codex review --focus security
```
