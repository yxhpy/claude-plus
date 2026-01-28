---
description: Apply the latest Codex diff to your working tree
disable-model-invocation: false
---

# Codex Apply

Apply the latest Codex diff to your working tree.

## Usage

```
/codex:apply
```

## What to do

1. Check if there's a pending Codex diff
2. Run `codex apply` (or `codex a`)
3. Report what changes were applied
4. Show git status after applying

## Example

```bash
# Apply the latest diff
codex apply
```

## Notes

- This applies changes from the most recent Codex session
- Review the diff before applying if unsure
- Use `git diff` to see what was changed
